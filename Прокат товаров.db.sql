BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Товар" (
	"Товар_ID"	INTEGER,
	"Название"	TEXT NOT NULL,
	"Категория"	TEXT NOT NULL,
	"Цена"	REAL NOT NULL,
	"Наличие"	INTEGER NOT NULL,
	PRIMARY KEY("Товар_ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Менеджер" (
	"Менеджер_ID"	INTEGER,
	"ФИО"	TEXT NOT NULL,
	"Телефон"	INTEGER NOT NULL,
	PRIMARY KEY("Менеджер_ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Заказ" (
	"Заказ_ID"	INTEGER,
	"Сумма_Оплаты"	REAL NOT NULL,
	"Дата_подтверждения"	TEXT NOT NULL,
	"Статус"	TEXT NOT NULL,
	"ID_Заявки"	INTEGER NOT NULL,
	"ID_Менеджер"	INTEGER NOT NULL,
	PRIMARY KEY("Заказ_ID" AUTOINCREMENT),
	FOREIGN KEY("ID_Менеджер") REFERENCES "Менеджер"("Менеджер_ID") ON DELETE CASCADE,
	FOREIGN KEY("ID_Заявки") REFERENCES "Заявка"("Заявка_ID") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Заявка" (
	"Заявка_ID"	INTEGER NOT NULL,
	"Дата_начала"	TEXT NOT NULL,
	"Дата_конца"	TEXT NOT NULL,
	"Статус"	TEXT NOT NULL,
	"ID_Клиента"	INTEGER NOT NULL,
	"ID_Товара"	INTEGER NOT NULL,
	PRIMARY KEY("Заявка_ID"),
	FOREIGN KEY("ID_Клиента") REFERENCES "Клиент"("Клиент_ID") ON DELETE CASCADE,
	FOREIGN KEY("ID_Товара") REFERENCES "Товар"("Товар_ID") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Клиент" (
	"Клиент_ID"	INTEGER,
	"ФИО"	TEXT NOT NULL,
	"Паспортные данные"	TEXT NOT NULL,
	"Телефон"	TEXT NOT NULL,
	PRIMARY KEY("Клиент_ID" AUTOINCREMENT)
);
INSERT INTO "Товар" VALUES (0,'','','',0);
INSERT INTO "Товар" VALUES (2,'','','',0);
INSERT INTO "Менеджер" VALUES (2,'',0);
INSERT INTO "Клиент" VALUES (1,'','','');
INSERT INTO "Клиент" VALUES (2,'Сергеев Максим Анатольевич ','2314734521','+79023254372');
COMMIT;
