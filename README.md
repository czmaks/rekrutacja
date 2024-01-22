# rekrutacjaTask

1. pobrać projekt z githuba (git clone https://github.com/czmaks/rekrutacja.git)
2. aby wszystko odpalić tak aby działało należy mieć zainstalowne: `npm`, `uvicorn` and `psql`
3. w głównej ścieżce nalezy póścić komendę `psql`, a następnie `\i path/to/rekrutacja/db.sql`
4. wejść do /rekrutacja i odpalić `npm install`, po zainstalowaniu wszystkiego można uruchomić strone wpisując `npm start`, strona będzie dosępna pod adresem http://localhost:3000
5. strona posiada 2 zakładki http://localhost:3000/getter or http://localhost:3000/basegetter, pierwsza służy do wprowadzania danych do bazy w formacie "xyz xyz","xyz xyz" można wprowadzić wiele wierszy do wyszukiwania oddzielonych enterem natomiast druga zakładka służy do pobierania danych z bazy
6. aby strona wyświetliła dane z bazy musi być odpalony serwer 
7. aby odpalić serwer należy przejść do folderu /rekrutacjaB i wpisać `uvicorn main:app --reload`


