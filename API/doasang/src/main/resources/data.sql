INSERT IGNORE INTO doasang.usuario (id, username, password) VALUES (1, 'usuario1', '$2a$10$ZHezVUQOsdVyZwB4ZVoihev5/IqPEpPyDEzpHYMJZrVHQo5pddJNe'); 

CREATE TABLE IF NOT EXISTS doasang.tipo_sanguineo 
(
    id INT PRIMARY KEY,
    descricao VARCHAR(5) NOT NULL
);

INSERT IGNORE INTO doasang.tipo_sanguineo(id, descricao) VALUES (1, 'A+');
INSERT IGNORE INTO doasang.tipo_sanguineo(id, descricao) VALUES (2, 'A-');
INSERT IGNORE INTO doasang.tipo_sanguineo(id, descricao) VALUES (3, 'B+');
INSERT IGNORE INTO doasang.tipo_sanguineo(id, descricao) VALUES (4, 'B-');
INSERT IGNORE INTO doasang.tipo_sanguineo(id, descricao) VALUES (5, 'AB+');
INSERT IGNORE INTO doasang.tipo_sanguineo(id, descricao) VALUES (6, 'AB-');
INSERT IGNORE INTO doasang.tipo_sanguineo(id, descricao) VALUES (7, 'O+');
INSERT IGNORE INTO doasang.tipo_sanguineo(id, descricao) VALUES (8, 'O-');

CREATE TABLE IF NOT EXISTS doasang.pode_doar_para 
(
    id_doador INT,
    id_receptor INT,
    PRIMARY KEY (id_doador, id_receptor),
    FOREIGN KEY (id_doador) REFERENCES tipo_sanguineo(id),
    FOREIGN KEY (id_receptor) REFERENCES tipo_sanguineo(id)
);

INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (1, 1);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (1, 5);

INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (2, 1);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (2, 2);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (2, 5);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (2, 6);

INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (3, 3);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (3, 5);

INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (4, 3);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (4, 4);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (4, 5);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (4, 6);

INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (5, 5);

INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (6, 5);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (6, 6);

INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (7, 1);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (7, 3);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (7, 5);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (7, 7);

INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (8, 1);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (8, 2);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (8, 3);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (8, 4);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (8, 5);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (8, 6);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (8, 7);
INSERT IGNORE INTO doasang.pode_doar_para(id_doador, id_receptor) VALUES (8, 8);


CREATE TABLE IF NOT EXISTS doasang.pode_receber_de 
(
    id_receptor INT,
    id_doador INT,
    PRIMARY KEY (id_receptor, id_doador),
    FOREIGN KEY (id_receptor) REFERENCES tipo_sanguineo(id),
	FOREIGN KEY (id_doador) REFERENCES tipo_sanguineo(id)
);

INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (1, 1);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (1, 2);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (1, 7);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (1, 8);

INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (2, 2);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (2, 8);

INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (3, 3);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (3, 4);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (3, 7);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (3, 8);

INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (4, 4);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (4, 8);

INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (5, 1);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (5, 2);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (5, 3);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (5, 4);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (5, 5);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (5, 6);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (5, 7);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (5, 8);

INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (6, 2);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (6, 4);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (6, 6);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (6, 8);

INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (7, 7);
INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (7, 8);

INSERT IGNORE INTO doasang.pode_receber_de(id_receptor, id_doador) VALUES (8, 8);


INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (1, 'Acre', 'AC');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (2, 'Alagoas', 'AL');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (3, 'Amapá', 'AP');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (4, 'Amazonas', 'AM');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (5, 'Bahia', 'BA');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (6, 'Ceará', 'CE');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (7, 'Distrito Federal', 'DF');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (8, 'Espírito Santo', 'ES');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (9, 'Goiás', 'GO');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (10, 'Maranhão', 'MA');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (11, 'Mato Grosso do Sul', 'MS');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (12, 'Mato Grosso', 'MT');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (13, 'Minas Gerais', 'MG');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (14, 'Paraná', 'PR');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (15, 'Paraíba', 'PB');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (16, 'Pará', 'PA');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (17, 'Pernambuco', 'PE');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (18, 'Piauí', 'PI');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (19, 'Rio de Janeiro', 'RJ');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (20, 'Rio Grande do Norte', 'RN');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (21, 'Rio Grande do Sul', 'RS');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (22, 'Rondônia', 'RO');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (23, 'Roraima', 'RR');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (24, 'Santa Catarina', 'SC');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (25, 'Sergipe', 'SE');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (26, 'São Paulo', 'SP');
INSERT IGNORE INTO doasang.estado (id, descricao, sigla) VALUES (27, 'Tocantins', 'TO');
		