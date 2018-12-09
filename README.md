# Laboratorio Virtual de Datos Anticorrupción
> Data scientists found that they spend most of their time massaging rather
> than mining or modeling data.
>
> 76% of data scientists view data preparation as the least enjoyable part of
> their work
>
>   - [Forbes survey][forbes-survey]

### Objetivos
- Estandarizar el proceso de **limpieza de datos**
  + [DVC][dvc]

- Tener **certeza** del contenido y el formato durante la exploración
  + [PostgreSQL][postgresql]

- Facilitar la exploración de datos usand herramientas gráficas de **consulta**
  + [Superset][superset]

### Proceso
```bash
                 +----------------+
                 | data/raw/*.csv |
                 +----------------+
                         *
                         *
                    (src/clean)
                         *
                         *
              +----------------------+
              | data/processed/*.csv |
              +----------------------+
                         *
                         *
                     (src/load)
                         *
                         *
                   +------------+
                   | PostgreSQL |
                   +------------+
```

### Ejemplo

```bash
#-------------
# Raw
#-------------

# Headers inconsistentes
head -n 1 data/raw/donatarias_autorizadas*.csv | less

# Encoding / Line terminators
file data/raw/donatarias_autorizadas*.csv

# Formato
head -n 5 data/raw/donatarias_autorizadas_20{0,1}6.csv | less

#-------------
# Clean
#-------------

vim src/clean/donatarias_autorizadas.sed

# Pipeline
vim data/processed/donatarias_autorizadas.dvc

# dvc repro data/processed/donatarias_autorizadas.dvc

# Formato
head -n 5 data/raw/donatarias_autorizadas_20{10}6.csv | less

# Load
vim src/load/donatarias_autorizadas.sql

# dvc repro src/load/donatarias_autorizadas.sql

#-------------
# Explore
#-------------
firefox http://localhost:8088

# Distribución por estado de la inversión nacional
```

[dvc]: http://dvc.org/
[postgresql]: http://postgresql.org/
[superset]: https://github.com/apache/incubator-superset
[forbes-survey]: https://www.forbes.com/sites/gilpress/2016/03/23/data-preparation-most-time-consuming-least-enjoyable-data-science-task-survey-says/#27aed8936f63
