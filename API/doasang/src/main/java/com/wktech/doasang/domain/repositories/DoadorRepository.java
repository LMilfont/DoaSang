package com.wktech.doasang.domain.repositories;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wktech.doasang.infrastructure.utils.TransformadorDTO;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;

@Repository
public class DoadorRepository {

    @Autowired
    EntityManager entityManager;

	// Native SQL Query.
	// Atende o requisito: Quantidade de possíveis doadores por tipo sanguíneo.
    public List<DoadoresPorTipoSanguineoDTO> findAll(){
        String sql = """
						SELECT 
						    CASE 
						        WHEN r.id = 1 THEN 'A+'
						        WHEN r.id = 2 THEN 'A-'
						        WHEN r.id = 3 THEN 'B+'
						        WHEN r.id = 4 THEN 'B-'
						        WHEN r.id = 5 THEN 'AB+'
						        WHEN r.id = 6 THEN 'AB-'
						        WHEN r.id = 7 THEN 'O+'
						        WHEN r.id = 8 THEN 'O-'
						    END AS tipoSanguineoReceptor,
						    t.descricao AS tipoSanguineoDoador,
						    COUNT(*) AS totalDoadores
						FROM 
						    candidato c
						JOIN 
						    tipo_sanguineo t ON c.tipo_sanguineo_id = t.id
						JOIN 
						    pode_receber_de pr ON c.tipo_sanguineo_id = pr.id_doador
						JOIN 
						    (SELECT 1 AS id UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8) r ON pr.id_receptor = r.id
						WHERE 
						    TIMESTAMPDIFF(YEAR, c.data_nasc, CURDATE()) BETWEEN 16 AND 69
						    AND c.peso > 50
						GROUP BY 
						    r.id, t.descricao
						ORDER BY 
						    r.id, t.descricao;
                """;
        Query nativeQuery = this.entityManager.createNativeQuery(sql);        

        List<DoadoresPorTipoSanguineoDTO> resultList = TransformadorDTO.transformar(nativeQuery.getResultList(), DoadoresPorTipoSanguineoDTO.class) ;

        return resultList;
    }  

    public record DoadoresPorTipoSanguineoDTO(String tipoSanguineoReceptor, String tipoSanguineoDoador, Long totalDoadores) {}

}
