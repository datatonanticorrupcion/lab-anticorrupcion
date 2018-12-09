drop table if exists donatarias_autorizadas;

create table donatarias_autorizadas (
    rfc                            text,
    razon_social                   text,
    tipo_donataria                 text,
    entidad_federativa             text,
    donativo_efectivo_nacional     text,
    donativo_efectivo_extranjero   text,
    donativo_especie_nacional      text,
    donativo_especie_extranjero    text,
    unidad_medida                  text,
    ejercicio_fiscal               text
);

\copy donatarias_autorizadas from ../../data/processed/donatarias_autorizadas_2011.csv with csv header
\copy donatarias_autorizadas from ../../data/processed/donatarias_autorizadas_2012.csv with csv header

alter table donatarias_autorizadas
    alter donativo_efectivo_nacional
    type bigint
    using replace(donativo_efectivo_nacional, ',', '')::bigint,

    alter donativo_efectivo_extranjero
    type bigint
    using replace(donativo_efectivo_extranjero, ',', '')::bigint,

    alter donativo_especie_nacional
    type bigint
    using replace(donativo_especie_nacional, ',', '')::bigint,

    alter donativo_especie_extranjero
    type bigint
    using replace(donativo_especie_extranjero, ',', '')::bigint,

    alter ejercicio_fiscal
    type date
    using to_date(ejercicio_fiscal, 'YYYY');
