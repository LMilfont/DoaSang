package com.wktech.doasang.domain.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.wktech.doasang.domain.entities.Candidato;

@Repository
public interface CandidatoRepository extends JpaRepository<Candidato, Integer> {

	// Query customizada para retornar o ID à partir de um CPF.
	@Query("SELECT c FROM Candidato c WHERE c.cpf = :cpf")
	Candidato findByCPF(@Param("cpf") String cpf);

	
	// HQL Query.
	// Atende o requisito: Candidatos por estado.
	@Query("""
			SELECT NEW com.wktech.doasang.presentation.dtos.CandidatosPorEstadoDTO(c.estado.descricao, COUNT(c.id))
			FROM Candidato c
			GROUP BY c.estado.descricao
			""")
	List findAll();

	
	// Native SQL Query.
	// Atende o requisito: IMC Médio por faixas etárias.
	@Query(value = """
					WITH Faixas AS (
					    SELECT '00_a_10' AS FAIXA UNION ALL
					    SELECT '11_a_20' UNION ALL
					    SELECT '21_a_30' UNION ALL
					    SELECT '31_a_40' UNION ALL
					    SELECT '41_a_50' UNION ALL
					    SELECT '51_a_60' UNION ALL
					    SELECT '61_a_70' UNION ALL
					    SELECT '71_a_80' UNION ALL
					    SELECT '81_a_90' UNION ALL
					    SELECT '91_a_100'
					)
					SELECT 
					    Faixas.FAIXA,
					    COALESCE(subquery.IMC_MEDIO, 0) AS IMC_MEDIO
					FROM Faixas
					LEFT JOIN (
					    SELECT 
					        CASE 
					            WHEN idade BETWEEN 0 AND 10 THEN '00_a_10'
					            WHEN idade BETWEEN 11 AND 20 THEN '11_a_20'
					            WHEN idade BETWEEN 21 AND 30 THEN '21_a_30'
					            WHEN idade BETWEEN 31 AND 40 THEN '31_a_40'
					            WHEN idade BETWEEN 41 AND 50 THEN '41_a_50'
					            WHEN idade BETWEEN 51 AND 60 THEN '51_a_60'
					            WHEN idade BETWEEN 61 AND 70 THEN '61_a_70'
					            WHEN idade BETWEEN 71 AND 80 THEN '71_a_80'
					            WHEN idade BETWEEN 81 AND 90 THEN '81_a_90'
					            WHEN idade BETWEEN 91 AND 100 THEN '91_a_100'
					        END AS FAIXA,
					        SUM(peso) / SUM(POW(altura, 2)) AS IMC_MEDIO
					    FROM (
					        SELECT 
					            peso, 
					            altura, 
					            YEAR(FROM_DAYS(TO_DAYS(NOW()) - TO_DAYS(data_nasc))) AS idade
					        FROM candidato
					    ) AS inner_subquery
					    GROUP BY FAIXA
					) AS subquery ON Faixas.FAIXA = subquery.FAIXA;			
				   """, nativeQuery = true)
	List findImcMedioPorFaixasEtarias();

	
	// Native SQL Query.
	// Atende o requisito: Percentual de obesos entre homens e mulheres.
	@Query(value = """
				SELECT TRUNCATE( IFNULL((a.QTD_HOMENS_OBESOS / b.TOTAL_HOMENS) * 100, 0), 2) AS PERCENTUAL_HOMENS_OBESOS,
				       TRUNCATE( IFNULL((c.QTD_MULHERES_OBESAS / d.TOTAL_MULHERES) * 100, 0), 2) AS PERCENTUAL_MULHERES_OBESAS
				FROM (
				    (SELECT COUNT(*) QTD_HOMENS_OBESOS FROM CANDIDATO WHERE SEXO = 'M' AND (PESO / POW(ALTURA, 2)) > 30) a,
				    (SELECT COUNT(*) TOTAL_HOMENS FROM CANDIDATO WHERE SEXO = 'M') b,
				    (SELECT COUNT(*) QTD_MULHERES_OBESAS FROM CANDIDATO WHERE SEXO = 'F' AND (PESO / POW(ALTURA, 2)) > 30) c,
				    (SELECT COUNT(*) TOTAL_MULHERES FROM CANDIDATO WHERE SEXO = 'F') d
				)
				   """, nativeQuery = true)
	List findPercentualDeObesosPorSexo(); 

	
	// Native SQL Query.
	// Atende o requisito: Média de idade para cada tipo sanguíneo.
	@Query(value = """
					SELECT t.descricao AS tipo_sanguineo, 
					       AVG(YEAR(FROM_DAYS(TO_DAYS(NOW())-TO_DAYS(data_nasc)))) AS media_de_idade
					FROM candidato c, tipo_sanguineo t
					WHERE c.tipo_sanguineo_id = t.id
					GROUP BY tipo_sanguineo_id
					ORDER BY tipo_sanguineo_id			
					""", nativeQuery = true)
	List findMediaIdadePorTipoSanguineo();

}
