--
-- PostgreSQL database dump
--

-- Dumped from database version 13.10 (Ubuntu 13.10-1.pgdg22.04+1)
-- Dumped by pg_dump version 13.10 (Ubuntu 13.10-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.session (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token character varying(100) NOT NULL
);


--
-- Name: session_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.session_id_seq OWNED BY public.session.id;


--
-- Name: short; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.short (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: short_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.short_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: short_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.short_id_seq OWNED BY public.short.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: session id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session ALTER COLUMN id SET DEFAULT nextval('public.session_id_seq'::regclass);


--
-- Name: short id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.short ALTER COLUMN id SET DEFAULT nextval('public.short_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: short; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.short VALUES (4, 'joao2@driven.com.br', 'uMSO9QkDiwcnYI9ZHqgrQ', 0, '2023-03-02 21:30:06.823665');
INSERT INTO public.short VALUES (5, 'joao2@driven.com.br', 'Y-C6ci2WLBaHZs78IA2DC', 0, '2023-03-02 21:30:32.11206');
INSERT INTO public.short VALUES (6, 'joao2@driven.com.br', '0hi8xz6PBKm-kr4hjBzfm', 0, '2023-03-02 21:31:12.851122');
INSERT INTO public.short VALUES (7, 'joao2@driven.com.br', '8NWq4OQ30UvFDhVDpKfpu', 0, '2023-03-02 21:35:45.457337');
INSERT INTO public.short VALUES (8, 'joao2@driven.com.br', 'FUX9yZosUwp47OfFx1vzT', 0, '2023-03-02 21:35:59.131768');
INSERT INTO public.short VALUES (9, 'joao2@driven.com.br', 'T1nzAPkKU5gzNJOxAGSdr', 0, '2023-03-02 21:36:38.864044');
INSERT INTO public.short VALUES (10, 'joao2@driven.com.br', 'tdtjwPE1Lzn4fNGCxj65f', 0, '2023-03-02 21:36:54.765047');
INSERT INTO public.short VALUES (11, 'joao2@driven.com.br', 'JND1urgC7yDf9Qv0JCpk5', 0, '2023-03-02 21:36:55.937214');
INSERT INTO public.short VALUES (12, 'joao2@driven.com.br', 'wop5j65LnOhhGXhvZb0sB', 0, '2023-03-02 21:43:14.398956');
INSERT INTO public.short VALUES (13, 'joao2@driven.com.br', 'DvMK-ur3cDtDw8ThVfZv-', 0, '2023-03-02 21:43:26.813834');
INSERT INTO public.short VALUES (14, 'joao2@driven.com.br', 'GaA9Wf7nMBD1eDXC-jC3-', 0, '2023-03-02 21:43:30.982708');
INSERT INTO public.short VALUES (15, 'joao2@driven.com.br', 'lfmPM5ieHkc55L7WXVDO7', 0, '2023-03-02 21:43:43.368422');
INSERT INTO public.short VALUES (16, 'joao2@driven.com.br', 'NTJ8yVK6wS7sdsC4MR_mx', 0, '2023-03-02 21:46:27.866263');
INSERT INTO public.short VALUES (17, 'joao2@driven.com.br', '9NWXTcrvBGCiHomHUACDL', 0, '2023-03-02 21:47:06.73327');
INSERT INTO public.short VALUES (18, 'joao2@driven.com.br', 'huejOr-FrjiFBhm7GD3Ji', 0, '2023-03-02 21:47:15.908241');
INSERT INTO public.short VALUES (19, 'joao2@driven.com.br', 'KZF1c2UZMYxnNtJlgSlF9', 0, '2023-03-02 21:50:13.730507');
INSERT INTO public.short VALUES (20, 'https://github.com/hapijs/joi/issues/1732', 'WGGpWSPyfVvgQ1ffL3Aps', 0, '2023-03-02 22:11:43.785863');
INSERT INTO public.short VALUES (21, 'https://github.com/hapijs/joi/issues/1732', 'uLk5uFdGz4EtpI02SD5Ly', 0, '2023-03-02 22:23:23.799074');
INSERT INTO public.short VALUES (22, 'https://github.com/hapijs/joi/issues/1732', 'oXbSun3oU_IlKCIMXUVgv', 0, '2023-03-02 22:23:50.05677');
INSERT INTO public.short VALUES (23, 'https://github.com/hapijs/joi/issues/1732', 'iR-9U7hHnzU6OGCqBnUsX', 0, '2023-03-02 22:24:06.436365');
INSERT INTO public.short VALUES (24, 'https://github.com/hapijs/joi/issues/1732', '7CtARPDZp4MBcHORhhMY6', 0, '2023-03-02 22:24:13.843819');
INSERT INTO public.short VALUES (25, 'https://github.com/hapijs/joi/issues/1732', 'oEQ2stL_4R6e8eQku5GEV', 0, '2023-03-02 22:24:16.818468');
INSERT INTO public.short VALUES (26, 'https://github.com/hapijs/joi/issues/1732', '0xZGz2HXStMPHmxjhnnTj', 0, '2023-03-02 22:24:40.705989');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'João', 'joao@driven.com.br', '$2b$10$KDFi64dl5fz3BgACtA2X2e7MrKoVtLLxsB9taTOmxWetbS3G0maHS', 0, '2023-03-02 18:51:47.494014');
INSERT INTO public.users VALUES (5, 'João', 'joao2@driven.com.br', '$2b$10$bnquAcGsYYOYVcnReRapw.OUcUTERs2EoKRHTMQ0TqtqHJcmmhi1e', 0, '2023-03-02 19:23:54.230757');


--
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.session_id_seq', 1, false);


--
-- Name: short_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.short_id_seq', 26, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: session session_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_token_key UNIQUE (token);


--
-- Name: short short_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.short
    ADD CONSTRAINT short_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: session session_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "session_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

