CREATE DATABASE portfolioMhnet; 
-- somente executar na hora da criacao do banco 

CREATE TABLE Usuario (
	Nome varchar NOT NULL,
	Matricula serial NOT NULL,
	Telefone FLOAT,
	Funcao VARCHAR NOT NULL,
	Senha VARCHAR NOT NULL,
	Email VARCHAR NOT NULL,
	CONSTRAINT Usuario_pk PRIMARY KEY (Matricula)
) WITH (
  OIDS=FALSE
);

CREATE TABLE Servicos (
	CodigoServico serial NOT NULL,
	MatriculaUsuario integer NOT NULL,
	DescricaoServico varchar NOT NULL,
	NomeServico varchar NOT NULL,
	Valor decimal NOT NULL,
	CONSTRAINT Servicos_pk PRIMARY KEY (CodigoServico)
) WITH (
  OIDS=FALSE
);

CREATE TABLE Equipamentos (
	IdEquipamento serial NOT NULL,
	Preco DECIMAL NOT NULL,
	Funcionalidade varchar NOT NULL,
	Modelo varchar NOT NULL,
	TaxaInstalacao DECIMAL NOT NULL,
	CONSTRAINT Equipamentos_pk PRIMARY KEY (IdEquipamento)
) WITH (
  OIDS=FALSE
);

CREATE TABLE Solicita (
	IdSolicitacao serial NOT NULL,
	Status varchar NOT NULL,
	DataSolicitacao DATE NOT NULL,
	DataConclusao DATE,
	LocalInstalacaoCliente integer NOT NULL,
	IdFormaPagamento integer NOT NULL,
	CodigoServicos integer NOT NULL,
	idCliente varchar NOT NULL,
	CONSTRAINT Solicita_pk PRIMARY KEY (IdSolicitacao)
) WITH (
  OIDS=FALSE
);
 
CREATE TABLE FormaPagamento (
	IdForma serial NOT NULL,
	Descricao varchar NOT NULL,
	Nome varchar NOT NULL,
	CONSTRAINT FormaPagamento_pk PRIMARY KEY (IdForma)
) WITH (
  OIDS=FALSE
);


CREATE TABLE Cliente (
	CPF varchar NOT NULL,
	Nome varchar NOT NULL,
	Email varchar NOT NULL,
	Telefone varchar NOT NULL,
	CONSTRAINT Cliente_pk PRIMARY KEY (CPF)
) WITH (
  OIDS=FALSE
);

CREATE TABLE Infraestrutura (
	IdEquipamento integer NOT NULL,
	CodigoServico integer NOT NULL,
	IdCodInfra serial NOT NULL,
	CONSTRAINT Infraestrutura_pk PRIMARY KEY (IdCodInfra)
) WITH (
  OIDS=FALSE
);

CREATE TABLE Endereco (
	Rua VARCHAR NOT NULL,
	Bairro VARCHAR NOT NULL,
	CEP integer NOT NULL,
	Numero integer NOT NULL,
	Complemento VARCHAR NOT NULL,
	idEndereco serial NOT NULL,
	CONSTRAINT Endereco_pk PRIMARY KEY (idEndereco)
) WITH (
  OIDS=FALSE
);


CREATE TABLE Local (
	IdEndereco integer NOT NULL,
	IdCliente varchar NOT NULL,
	idLocal serial NOT NULL,
	Local integer
) WITH (
  OIDS=FALSE
);

ALTER TABLE Servicos ADD CONSTRAINT Servicos_fk0 FOREIGN KEY (MatriculaUsuario) REFERENCES Usuario(Matricula);

ALTER TABLE Solicita ADD CONSTRAINT Solicita_fk1 FOREIGN KEY (IdFormaPagamento) REFERENCES FormaPagamento(IdForma);
ALTER TABLE Solicita ADD CONSTRAINT Solicita_fk2 FOREIGN KEY (CodigoServicos) REFERENCES Servicos(CodigoServico);
ALTER TABLE Solicita ADD CONSTRAINT Solicita_fk3 FOREIGN KEY (idCliente) REFERENCES Cliente(CPF);

ALTER TABLE Infraestrutura ADD CONSTRAINT Infraestrutura_fk0 FOREIGN KEY (IdEquipamento) REFERENCES Equipamentos(IdEquipamento);
ALTER TABLE Infraestrutura ADD CONSTRAINT Infraestrutura_fk1 FOREIGN KEY (CodigoServico) REFERENCES Servicos(CodigoServico);

ALTER TABLE Local ADD CONSTRAINT Local_fk0 FOREIGN KEY (IdEndereco) REFERENCES Endereco(idEndereco);
ALTER TABLE Local ADD CONSTRAINT Local_fk1 FOREIGN KEY (IdCliente) REFERENCES Cliente(CPF);

