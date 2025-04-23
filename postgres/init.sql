CREATE USER myuser WITH PASSWORD '123';
CREATE DATABASE mydb;
GRANT ALL PRIVILEGES ON DATABASE mydb TO myuser;

CREATE TABLE public.clientes (
    id bigint NOT NULL,
    nombre character varying(255)
);

CREATE SEQUENCE public.clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.productos (
    id bigint NOT NULL,
    nombre character varying(255),
    precio numeric(9,6)
);

CREATE SEQUENCE public.productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.venta (
    id bigint NOT NULL,
    fecha date,
    monto numeric(9,6),
    idcliente bigint
);
CREATE TABLE public.venta_det (
    idrow bigint NOT NULL,
    cantidad bigint,
    descripcion character varying(255),
    precio numeric(19,2),
    producto bigint,
    idproducto bigint NOT NULL,
    idventa bigint
);
CREATE SEQUENCE public.venta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.ventadet (
    idrow bigint NOT NULL,
    cantidad bigint,
    descripcion character varying(255),
    precio numeric(19,2),
    idproducto bigint NOT NULL,
    idventa bigint
);

CREATE SEQUENCE public.ventadet_idlinea_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.venta_det
    ADD CONSTRAINT venta_det_pkey PRIMARY KEY (idrow);

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.ventadet
    ADD CONSTRAINT ventadet_pkey PRIMARY KEY (idrow);

ALTER TABLE ONLY public.ventadet
    ADD CONSTRAINT fk3ifihch1h3hqmocbb0kddijut FOREIGN KEY (idventa) REFERENCES public.venta(id);

ALTER TABLE ONLY public.ventadet
    ADD CONSTRAINT fk53kb5fcawm2pkr1u44nae2q1n FOREIGN KEY (idproducto) REFERENCES public.productos(id);

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT fkonuo92secryiw48cdnv27gg3m FOREIGN KEY (idcliente) REFERENCES public.clientes(id);
