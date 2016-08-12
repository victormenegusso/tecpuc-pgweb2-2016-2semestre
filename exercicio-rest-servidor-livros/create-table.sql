CREATE TABLE `tecpuc_rest`.`livros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `autor` VARCHAR(45) NULL,
  `descricao` VARCHAR(500) NULL,
  `editora` VARCHAR(45) NULL,
  `genero` VARCHAR(45) NULL,
  `origem` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
