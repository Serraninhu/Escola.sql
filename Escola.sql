
CREATE DATABASE escola;
USE escola;

CREATE TABLE curso (
    CodCurso CHAR(3) PRIMARY KEY,  
    nome VARCHAR(50),             
    mensalidade DECIMAL(10,2)      
);


CREATE TABLE disciplina (
    CodDisc INT PRIMARY KEY,       
    nome CHAR(30),                 
    CodCurso CHAR(3),           
    NroCreditos INT,               
    FOREIGN KEY (CodCurso) REFERENCES curso(CodCurso)  
);


CREATE TABLE aluno (
    RA CHAR(9) PRIMARY KEY,       
    RG CHAR(9),                    
    nome VARCHAR(30),            
    CodCurso CHAR(3),            
    FOREIGN KEY (CodCurso) REFERENCES curso(CodCurso)  
);


CREATE TABLE boletim (
    RA CHAR(9),                  
    CodDisc INT,                   
    nota DECIMAL(4,2),             
    PRIMARY KEY (RA, CodDisc),     
    FOREIGN KEY (RA) REFERENCES aluno(RA),        
    FOREIGN KEY (CodDisc) REFERENCES disciplina(CodDisc) 
);

-- Inserção de dados nos cursos
INSERT INTO curso (CodCurso, nome, mensalidade) VALUES
('ADS', 'Análise e Desenvolvimento de Sistemas', 650.00),
('ADM', 'Administração', 500.00);

-- Inserção de disciplinas
INSERT INTO disciplina (CodDisc, nome, CodCurso, NroCreditos) VALUES
(1, 'Banco de Dados', 'ADS', 4),
(2, 'Matemática Financeira', 'ADM', 3),
(3, 'Algoritmos', 'ADS', 5);

-- Inserção de alunos
INSERT INTO aluno (RA, RG, nome, CodCurso) VALUES
('000000001', '111111111', 'Ana Silva', 'ADS'),
('000000002', '222222222', 'Bruno Costa', 'ADM'),
('000000003', '333333333', 'Carlos Souza', 'ADS');

-- Inserção de notas no boletim
INSERT INTO boletim (RA, CodDisc, nota) VALUES
('000000001', 1, 8.5),
('000000001', 3, 9.0),
('000000002', 2, 7.0),
('000000003', 1, 6.5);


SELECT COUNT(*) AS total_disciplinas FROM disciplina;


SELECT COUNT(*) AS total_alunos FROM aluno;

SELECT nome AS curso_oferecido FROM curso;

