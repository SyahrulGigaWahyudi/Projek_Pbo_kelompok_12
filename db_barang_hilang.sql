--
-- PostgreSQL database dump
--

\restrict PW6zwb91o0inzpleBsTeRJGwsJa36RJ5akRt2ckhLJaa1wKCXpVjZdqt9Ba3PW1

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

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
-- Name: laporan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.laporan (
    id integer NOT NULL,
    user_id integer,
    nama_barang character varying(100),
    deskripsi text,
    foto character varying(255),
    tanggal_hilang date,
    status character varying(50),
    lokasi character varying(100)
);


ALTER TABLE public.laporan OWNER TO postgres;

--
-- Name: laporan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.laporan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.laporan_id_seq OWNER TO postgres;

--
-- Name: laporan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.laporan_id_seq OWNED BY public.laporan.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    nama_lengkap character varying(100),
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(20) DEFAULT 'mahasiswa'::character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: laporan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laporan ALTER COLUMN id SET DEFAULT nextval('public.laporan_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: laporan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.laporan (id, user_id, nama_barang, deskripsi, foto, tanggal_hilang, status, lokasi) FROM stdin;
12	1	Buku Atomic Habits	Buku Berjudul Atomic Habits dengan cover masih bagus	1768040857367_photo_2026-01-10_17-26-16.jpg	2026-01-08	Ditemukan	Gedung A Ruang 402
13	1	Stopkontak	Stopkontak 4 Colokan 	1768041030948_photo_2026-01-10_17-26-06.jpg	2026-01-09	Ditemukan	Gendung B ruang 301
14	1	Tws putih	Tws Merek Robot warna putih	1768041124247_photo_2026-01-10_17-26-14.jpg	2026-01-07	Ditemukan	Gendung B ruang 303
15	2	Chager Handphone	kepala Chager warna hijau dan kabel warna putih merek robot	1768041293028_photo_2026-01-10_17-26-12.jpg	2026-01-10	Hilang	Gedung A Ruang 403
16	4	Tws hitam	tws hitam merek ripple	1768041381764_photo_2026-01-10_17-26-10.jpg	2026-01-10	Hilang	Gendung B ruang 302
17	2	Powerbank 	powerbank 20.000 mah merek vention warna hitam	1768041462723_photo_2026-01-10_17-26-09.jpg	2026-01-10	Ditemukan	Gedung A Ruang 401
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, nama_lengkap, email, password, role) FROM stdin;
1	Admin	admin@kampus.ac.id	123	admin
2	syahrul giga wahyudi	giga@test.com	123	siswa
4	budi santoso	budi@kampus.ac.id	123	siswa
\.


--
-- Name: laporan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.laporan_id_seq', 17, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: laporan laporan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laporan
    ADD CONSTRAINT laporan_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: laporan laporan_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laporan
    ADD CONSTRAINT laporan_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict PW6zwb91o0inzpleBsTeRJGwsJa36RJ5akRt2ckhLJaa1wKCXpVjZdqt9Ba3PW1

