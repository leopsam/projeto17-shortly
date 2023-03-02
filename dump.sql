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
-- Name: rank; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rank (
    id integer NOT NULL,
    "userShortId" integer NOT NULL,
    "linksCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


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
-- Name: userShort; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."userShort" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "shortId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Data for Name: rank; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: short; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: userShort; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: rank rank_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rank
    ADD CONSTRAINT rank_pkey PRIMARY KEY (id);


--
-- Name: short short_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.short
    ADD CONSTRAINT short_pkey PRIMARY KEY (id);


--
-- Name: userShort userShort_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userShort"
    ADD CONSTRAINT "userShort_pkey" PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: rank rank_userShortId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rank
    ADD CONSTRAINT "rank_userShortId_fkey" FOREIGN KEY ("userShortId") REFERENCES public."userShort"(id);


--
-- Name: userShort userShort_shortId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userShort"
    ADD CONSTRAINT "userShort_shortId_fkey" FOREIGN KEY ("shortId") REFERENCES public.short(id);


--
-- Name: userShort userShort_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userShort"
    ADD CONSTRAINT "userShort_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

