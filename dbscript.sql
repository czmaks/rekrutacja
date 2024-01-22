--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: ebooks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ebooks (
    id integer NOT NULL,
    name character varying,
    title character varying,
    curr character varying,
    price double precision,
    date date
);


--
-- Name: ebooks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ebooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ebooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ebooks_id_seq OWNED BY public.ebooks.id;


--
-- Name: nbp_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nbp_data (
    id integer NOT NULL,
    ebook_id integer,
    rate double precision,
    "pricePLN" double precision,
    "tableNo" character varying
);


--
-- Name: nbp_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nbp_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nbp_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nbp_data_id_seq OWNED BY public.nbp_data.id;


--
-- Name: ebooks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ebooks ALTER COLUMN id SET DEFAULT nextval('public.ebooks_id_seq'::regclass);


--
-- Name: nbp_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nbp_data ALTER COLUMN id SET DEFAULT nextval('public.nbp_data_id_seq'::regclass);


--
-- Data for Name: ebooks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ebooks (id, name, title, curr, price, date) FROM stdin;
1	Agatha Christie	The Secret Adversary	USD	0	2008-09-14
2	Agatha Christie	The Mysterious Affair at Styles	USD	0	2008-07-27
3	Agatha Christie	The Mysterious Affair at Styles	USD	0.99	2017-11-18
4	Agatha Christie	The Mysterious Affair at Styles	USD	0	1932-01-01
5	Agatha Christie	The Mysterious Affair at Styles	USD	0	2014-05-25
6	Agatha Christie	The Secret Adversary	USD	0	2022-11-17
7	Agatha Christie	And Then There Were None	USD	0.99	2023-12-10
8	Agatha Christie	The Secret Adversary	USD	0.99	2015-02-04
9	Agatha Christie	The Secret Adversary	USD	2.99	2012-08-29
10	Agatha Christie	The Secret Adversary	USD	5.99	2014-05-27
11	Agatha Christie	The Secret Adversary	USD	1.99	2018-06-05
12	Agatha Christie	And Then There Were None	USD	0.99	2022-05-22
13	Agatha Christie	The Secret Adversary	USD	5.99	2005-05-31
14	Agatha Christie	The Secret Adversary	USD	0.99	2020-03-12
15	Agatha Christie	The Mysterious Affair at Styles	USD	6.99	2019-04-30
16	Agatha Christie	The Mysterious Affair at Styles	USD	10.99	2009-03-17
17	Agatha Christie & Elizabeth George	The Mysterious Affair at Styles	USD	2.99	2003-12-09
18	Agatha Christie	The Mysterious Affair at Styles	USD	1.99	2024-01-16
19	Agatha Christie	The Mysterious Affair at Styles	USD	0.99	2022-02-02
20	Agatha Christie	The Mysterious Affair at Styles	USD	1.99	2018-11-27
21	Agatha Christie	The Mysterious Affair at Styles	USD	9.99	2021-09-07
22	Agatha Christie	The Mysterious Affair at Styles	USD	0.99	2015-09-11
23	Agatha Christie	And Then There Were None	USD	0.99	2022-04-01
24	Agatha Christie	And Then There Were None	USD	0.99	2020-10-05
25	Agatha Christie	And Then There Were None	USD	18.99	2015-09-16
26	Agatha Christie	And Then There Were None	USD	6.99	2023-12-20
27	Agatha Christie	The Mysterious Affair at Styles	USD	5.99	2014-05-27
28	Agatha Christie	And Then There Were None	USD	0.99	2023-05-02
29	Agatha Christie	And Then There Were None	USD	6.99	2023-10-10
30	Agatha Christie	And Then There Were None	USD	9.99	2009-03-17
\.


--
-- Data for Name: nbp_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nbp_data (id, ebook_id, rate, "pricePLN", "tableNo") FROM stdin;
1	6	4.5387	0	222/A/NBP/2022
2	8	3.644	3.60756	023/A/NBP/2015
3	9	3.3081	9.891219000000001	167/A/NBP/2012
4	10	3.0532	18.288668	101/A/NBP/2014
5	11	3.6569	7.277231	107/A/NBP/2018
6	13	3.3265	19.925735	103/A/NBP/2005
7	14	3.8642	3.825558	050/A/NBP/2020
8	15	3.8291	26.765409000000002	084/A/NBP/2019
9	16	3.4373	37.775927	53/A/NBP/2009
10	17	3.8084	11.387116	239/A/NBP/2003
11	18	4.0358	8.031242	011/A/NBP/2024
12	19	4.0283	3.9880169999999997	022/A/NBP/2022
13	20	3.7948	7.551652	230/A/NBP/2018
14	21	3.8041	38.002959000000004	173/A/NBP/2021
15	22	3.7264	3.689136	177/A/NBP/2015
16	23	4.1978	4.155822	064/A/NBP/2022
17	24	3.8252	3.786948	194/A/NBP/2020
18	25	3.7315	70.86118499999999	180/A/NBP/2015
19	26	3.9527	27.629373	246/A/NBP/2023
20	27	3.0532	18.288668	101/A/NBP/2014
21	28	4.1823	4.140477	084/A/NBP/2023
22	29	4.2985	30.046515	196/A/NBP/2023
23	30	3.4373	34.338627	53/A/NBP/2009
\.


--
-- Name: ebooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ebooks_id_seq', 30, true);


--
-- Name: nbp_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nbp_data_id_seq', 23, true);


--
-- Name: ebooks ebooks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ebooks
    ADD CONSTRAINT ebooks_pkey PRIMARY KEY (id);


--
-- Name: nbp_data nbp_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nbp_data
    ADD CONSTRAINT nbp_data_pkey PRIMARY KEY (id);


--
-- Name: ix_ebooks_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_ebooks_id ON public.ebooks USING btree (id);


--
-- Name: ix_ebooks_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_ebooks_name ON public.ebooks USING btree (name);


--
-- Name: ix_nbp_data_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_nbp_data_id ON public.nbp_data USING btree (id);


--
-- Name: nbp_data nbp_data_ebook_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nbp_data
    ADD CONSTRAINT nbp_data_ebook_id_fkey FOREIGN KEY (ebook_id) REFERENCES public.ebooks(id);


--
-- PostgreSQL database dump complete
--

