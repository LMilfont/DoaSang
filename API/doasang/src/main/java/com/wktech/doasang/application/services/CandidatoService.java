package com.wktech.doasang.application.services;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Service;

import com.wktech.doasang.domain.entities.Candidato;
import com.wktech.doasang.domain.entities.Estado;
import com.wktech.doasang.domain.entities.TipoSanguineo;
import com.wktech.doasang.domain.repositories.CandidatoRepository;
import com.wktech.doasang.domain.repositories.EstadoRepository;
import com.wktech.doasang.domain.repositories.TipoSanguineoRepository;
import com.wktech.doasang.presentation.dtos.CandidatoPayloadDTO;

@Service
public class CandidatoService {
	@Autowired
	private CandidatoRepository candidatoRepository;
	
	@Autowired
	private EstadoRepository estadoRepository;

	@Autowired
	private TipoSanguineoRepository tipoSanguineoRepository;

    @Autowired
    ModelMapper modelMapper;

	@Autowired
    private CacheManager cacheManager;

	public void upload(List<CandidatoPayloadDTO> candidatos) throws Exception {

		// Itera sobre o payload de candidatos enviados.
		for (CandidatoPayloadDTO candidatoAtual : candidatos) {

			// Verifica se o candidato atual já existe na base de dados, usando o CPF como identificador.
 		    Candidato c = candidatoRepository.findByCPF(candidatoAtual.getCpf());

			// Obtém os dados do estado à partir da sigla, presente nos dados do candidato atual.
	        Estado estado = estadoRepository.findBySigla( candidatoAtual.getEstado() );
	
			// Obtém o tipo sanguíneo presente nos dados do candidato atual.
	        TipoSanguineo tipoSanguineo = tipoSanguineoRepository.findByDescricao( candidatoAtual.getTipo_sanguineo() );

			if ( (estado != null) && (tipoSanguineo != null) ) 
				// Se for uma sigla inexistente de estado, não armazena o candidato atual.
				// Se faltar a informação do tipo sanguíneo, não armazena o candidato atual.
			{
				
				// Mapeia o candidato (json) passado pelo frontend num objeto da classe Candidato.
				Candidato candidato = modelMapper.map(candidatoAtual, Candidato.class);

				// Especifica o ID do candidato, caso ele já tenha sido encontrado, para que promova um update.
				if (c != null) {
					candidato.setId(c.getId());
				}					
				
				// Atualiza os dados do estado do candidato.
				candidato.setEstado(estado);

				// Atualiza os dados do tipo sanguineo do candidato.
				candidato.setTipo_sanguineo(tipoSanguineo);

				// Atualiza o campo sexo. 
				candidato.setSexo(candidatoAtual.getSexo().equals("Masculino") ? "M" : candidatoAtual.getSexo().equals("Feminino") ? "F" : "");
							
				// Por fim, salva (insere ou atualiza) o candidato.			
				this.candidatoRepository.saveAndFlush(candidato);
			}
			
		}

		// Verifica se há caches criados em memória.
		// Em caso afirmativo, limpa os caches a fim de atualizar as informações.
		if (cacheManager.getCache("candidatos-por-estado") != null) {
			this.cacheManager.getCache("candidatos-por-estado").clear();
		}
		if (cacheManager.getCache("doadores-por-tipo-sanguineo") != null) {
			this.cacheManager.getCache("doadores-por-tipo-sanguineo").clear();
		}
		if (cacheManager.getCache("imc-medio-por-faixas-etarias") != null) {
			this.cacheManager.getCache("imc-medio-por-faixas-etarias").clear();
		}
		if (cacheManager.getCache("media-de-idade-por-tipo-sanguineo") != null) {
			this.cacheManager.getCache("media-de-idade-por-tipo-sanguineo").clear();
		}
		if (cacheManager.getCache("percentual-de-obesos-por-sexo") != null) {
			this.cacheManager.getCache("percentual-de-obesos-por-sexo").clear();
		}
		
	}
}