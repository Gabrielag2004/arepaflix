--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: capitulos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.capitulos (
    id integer NOT NULL,
    numero_capitulo integer NOT NULL,
    fecha_publicacion timestamp without time zone NOT NULL
);


ALTER TABLE public.capitulos OWNER TO postgres;

--
-- Name: capitulos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.capitulos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.capitulos_id_seq OWNER TO postgres;

--
-- Name: capitulos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.capitulos_id_seq OWNED BY public.capitulos.id;


--
-- Name: comentarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comentarios (
    id integer NOT NULL,
    comentario character varying(400) NOT NULL,
    fecha_publicacion timestamp without time zone NOT NULL
);


ALTER TABLE public.comentarios OWNER TO postgres;

--
-- Name: comentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comentarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comentarios_id_seq OWNER TO postgres;

--
-- Name: comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comentarios_id_seq OWNED BY public.comentarios.id;


--
-- Name: contenidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contenidos (
    id integer NOT NULL,
    puntuacion_id integer NOT NULL,
    comentario_id integer NOT NULL,
    temporada_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(200) NOT NULL,
    genero character varying(50),
    ano_lanzamiento integer,
    cantidad_temporada integer,
    fecha_publicacion timestamp without time zone NOT NULL
);


ALTER TABLE public.contenidos OWNER TO postgres;

--
-- Name: contenidos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contenidos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contenidos_id_seq OWNER TO postgres;

--
-- Name: contenidos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contenidos_id_seq OWNED BY public.contenidos.id;


--
-- Name: contenidos_suscripciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contenidos_suscripciones (
    id integer NOT NULL,
    suscripcion_id integer NOT NULL,
    contenido_id integer NOT NULL,
    calidad_disponible character varying(5) NOT NULL
);


ALTER TABLE public.contenidos_suscripciones OWNER TO postgres;

--
-- Name: contenidos_suscripciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contenidos_suscripciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contenidos_suscripciones_id_seq OWNER TO postgres;

--
-- Name: contenidos_suscripciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contenidos_suscripciones_id_seq OWNED BY public.contenidos_suscripciones.id;


--
-- Name: puntuaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puntuaciones (
    id integer NOT NULL,
    valor numeric(2,1) NOT NULL,
    fecha_publicacion timestamp without time zone NOT NULL
);


ALTER TABLE public.puntuaciones OWNER TO postgres;

--
-- Name: puntuaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.puntuaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.puntuaciones_id_seq OWNER TO postgres;

--
-- Name: puntuaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puntuaciones_id_seq OWNED BY public.puntuaciones.id;


--
-- Name: suscripciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suscripciones (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    caracteristicas character varying(200),
    precio numeric(10,2) NOT NULL,
    cantidad_pantallas integer NOT NULL,
    duracion_meses integer NOT NULL
);


ALTER TABLE public.suscripciones OWNER TO postgres;

--
-- Name: suscripciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suscripciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suscripciones_id_seq OWNER TO postgres;

--
-- Name: suscripciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suscripciones_id_seq OWNED BY public.suscripciones.id;


--
-- Name: temporadas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temporadas (
    id integer NOT NULL,
    capitulo_id integer NOT NULL,
    numero_temporada integer NOT NULL,
    cantidad_capitulo integer NOT NULL,
    ano_lanzamiento integer,
    fecha_publicacion timestamp without time zone NOT NULL
);


ALTER TABLE public.temporadas OWNER TO postgres;

--
-- Name: temporadas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temporadas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.temporadas_id_seq OWNER TO postgres;

--
-- Name: temporadas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temporadas_id_seq OWNED BY public.temporadas.id;


--
-- Name: capitulos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capitulos ALTER COLUMN id SET DEFAULT nextval('public.capitulos_id_seq'::regclass);


--
-- Name: comentarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios ALTER COLUMN id SET DEFAULT nextval('public.comentarios_id_seq'::regclass);


--
-- Name: contenidos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidos ALTER COLUMN id SET DEFAULT nextval('public.contenidos_id_seq'::regclass);


--
-- Name: contenidos_suscripciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidos_suscripciones ALTER COLUMN id SET DEFAULT nextval('public.contenidos_suscripciones_id_seq'::regclass);


--
-- Name: puntuaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puntuaciones ALTER COLUMN id SET DEFAULT nextval('public.puntuaciones_id_seq'::regclass);


--
-- Name: suscripciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suscripciones ALTER COLUMN id SET DEFAULT nextval('public.suscripciones_id_seq'::regclass);


--
-- Name: temporadas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temporadas ALTER COLUMN id SET DEFAULT nextval('public.temporadas_id_seq'::regclass);


--
-- Data for Name: capitulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.capitulos (id, numero_capitulo, fecha_publicacion) FROM stdin;
\.


--
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentarios (id, comentario, fecha_publicacion) FROM stdin;
\.


--
-- Data for Name: contenidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contenidos (id, puntuacion_id, comentario_id, temporada_id, nombre, descripcion, genero, ano_lanzamiento, cantidad_temporada, fecha_publicacion) FROM stdin;
\.


--
-- Data for Name: contenidos_suscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contenidos_suscripciones (id, suscripcion_id, contenido_id, calidad_disponible) FROM stdin;
\.


--
-- Data for Name: puntuaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.puntuaciones (id, valor, fecha_publicacion) FROM stdin;
\.


--
-- Data for Name: suscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suscripciones (id, nombre, caracteristicas, precio, cantidad_pantallas, duracion_meses) FROM stdin;
1	Arepita Básica	Acceso a contenido estándar...	5.98	1	1
4	Empanada Estándar	Acceso a descarga para ver offline	9.98	2	1
\.


--
-- Data for Name: temporadas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temporadas (id, capitulo_id, numero_temporada, cantidad_capitulo, ano_lanzamiento, fecha_publicacion) FROM stdin;
\.


--
-- Name: capitulos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.capitulos_id_seq', 1, false);


--
-- Name: comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comentarios_id_seq', 1, false);


--
-- Name: contenidos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contenidos_id_seq', 9, true);


--
-- Name: contenidos_suscripciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contenidos_suscripciones_id_seq', 1, false);


--
-- Name: puntuaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puntuaciones_id_seq', 1, false);


--
-- Name: suscripciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suscripciones_id_seq', 4, true);


--
-- Name: temporadas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temporadas_id_seq', 1, false);


--
-- Name: capitulos capitulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capitulos
    ADD CONSTRAINT capitulos_pkey PRIMARY KEY (id);


--
-- Name: comentarios comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);


--
-- Name: contenidos contenidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidos
    ADD CONSTRAINT contenidos_pkey PRIMARY KEY (id);


--
-- Name: contenidos_suscripciones contenidos_suscripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidos_suscripciones
    ADD CONSTRAINT contenidos_suscripciones_pkey PRIMARY KEY (id);


--
-- Name: puntuaciones puntuaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puntuaciones
    ADD CONSTRAINT puntuaciones_pkey PRIMARY KEY (id);


--
-- Name: suscripciones suscripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suscripciones
    ADD CONSTRAINT suscripciones_pkey PRIMARY KEY (id);


--
-- Name: temporadas temporadas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temporadas
    ADD CONSTRAINT temporadas_pkey PRIMARY KEY (id);


--
-- Name: ix_capitulos_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_capitulos_id ON public.capitulos USING btree (id);


--
-- Name: ix_comentarios_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_comentarios_id ON public.comentarios USING btree (id);


--
-- Name: ix_contenidos_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_contenidos_id ON public.contenidos USING btree (id);


--
-- Name: ix_contenidos_suscripciones_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_contenidos_suscripciones_id ON public.contenidos_suscripciones USING btree (id);


--
-- Name: ix_puntuaciones_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_puntuaciones_id ON public.puntuaciones USING btree (id);


--
-- Name: ix_suscripciones_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_suscripciones_id ON public.suscripciones USING btree (id);


--
-- Name: ix_temporadas_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_temporadas_id ON public.temporadas USING btree (id);


--
-- Name: contenidos contenidos_comentario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidos
    ADD CONSTRAINT contenidos_comentario_id_fkey FOREIGN KEY (comentario_id) REFERENCES public.comentarios(id);


--
-- Name: contenidos contenidos_puntuacion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidos
    ADD CONSTRAINT contenidos_puntuacion_id_fkey FOREIGN KEY (puntuacion_id) REFERENCES public.puntuaciones(id);


--
-- Name: contenidos_suscripciones contenidos_suscripciones_contenido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidos_suscripciones
    ADD CONSTRAINT contenidos_suscripciones_contenido_id_fkey FOREIGN KEY (contenido_id) REFERENCES public.contenidos(id);


--
-- Name: contenidos_suscripciones contenidos_suscripciones_suscripcion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidos_suscripciones
    ADD CONSTRAINT contenidos_suscripciones_suscripcion_id_fkey FOREIGN KEY (suscripcion_id) REFERENCES public.suscripciones(id);


--
-- Name: contenidos contenidos_temporada_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidos
    ADD CONSTRAINT contenidos_temporada_id_fkey FOREIGN KEY (temporada_id) REFERENCES public.temporadas(id);


--
-- Name: temporadas temporadas_capitulo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temporadas
    ADD CONSTRAINT temporadas_capitulo_id_fkey FOREIGN KEY (capitulo_id) REFERENCES public.capitulos(id);


--
-- PostgreSQL database dump complete
--

