/*
Week 3 queries
*/

# 3.5 SQL-DDL

/*
Добавить таблицу 'best_offer_sale' со следующими полями:

Название: `id`, тип данных: INT, возможность использования неопределенного значения: Нет, первичный ключ
Название: `name`, тип данных: VARCHAR(255), возможность использования неопределенного значения: Да
Название: `dt_start`, тип данных: DATETIME, возможность использования неопределенного значения: Нет
Название: `dt_finish`, тип данных: DATETIME, возможность использования неопределенного значения: Нет
*/
CREATE TABLE best_offer_sale
( id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255),
  dt_start DATETIME NOT NULL,
  dt_finish DATETIME NOT NULL
);

/* 
В таблице 'client' ограничение внешнего ключа называется 'fk_client_source1', определенное на поле 'source_id'.
Удалите из таблицы 'client' поля 'code' и 'source_id'.
*/

ALTER TABLE client
DROP FOREIGN KEY fk_client_source1,
DROP code,
DROP source_id;


# Удалите таблицу 'source'.
DROP TABLE source;

/*
Добавьте в таблицу 'sale_has_good' следующие поля:
Название: `num`, тип данных: INT, возможность использования неопределенного значения: Нет
Название: `price`, тип данных: DECIMAL(18,2), возможность использования неопределенного значения: Нет
*/

ALTER TABLE sale_has_good
ADD num INT NOT NULL,
ADD price DECIMAL(18, 2) NOT NULL;

/*
Добавьте в таблицу 'client' поле 'source_id' тип данных: INT, возможность использования неопределенного значения: Да. Для данного поля определите ограничение внешнего ключа как ссылку на поле 'id' таблицы 'source'.
*/

ALTER TABLE client
ADD source_id INT,
ADD CONSTRAINT fk_client_source_id FOREIGN KEY(source_id) REFERENCES source(id);












