--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Food; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Food" (
    "FOOD_ID" integer NOT NULL,
    "DESCRIPTION" character varying(255),
    "CALORIES(KCAL)" integer,
    "TOTAL_FAT(g)" real,
    "TOTAL_CARBS(g)" integer,
    "TOTAL_PROTEIN(g)" integer,
    "SERVING_SIZE" character varying(255),
    "LOCATION" character varying(255)
);


ALTER TABLE public."Food" OWNER TO postgres;

--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO postgres;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_id_seq OWNER TO postgres;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO postgres;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_lock_index_seq OWNER TO postgres;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- Name: login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login (
    id integer NOT NULL,
    hash character varying(100) NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.login OWNER TO postgres;

--
-- Name: login_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_id_seq OWNER TO postgres;

--
-- Name: login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login_id_seq OWNED BY public.login.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100),
    email text NOT NULL,
    joined timestamp without time zone NOT NULL,
    caloric_goals integer DEFAULT 0,
    daily_calorie integer DEFAULT 0,
    gender text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: usersTable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."usersTable" (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password_digest character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "daily_Calories" integer DEFAULT 1800,
    "firstName" character varying(255),
    "lastName" character varying(255)
);


ALTER TABLE public."usersTable" OWNER TO postgres;

--
-- Name: usersTable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."usersTable_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."usersTable_id_seq" OWNER TO postgres;

--
-- Name: usersTable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."usersTable_id_seq" OWNED BY public."usersTable".id;


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


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- Name: login id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login ALTER COLUMN id SET DEFAULT nextval('public.login_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: usersTable id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."usersTable" ALTER COLUMN id SET DEFAULT nextval('public."usersTable_id_seq"'::regclass);


--
-- Data for Name: Food; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Food" ("FOOD_ID", "DESCRIPTION", "CALORIES(KCAL)", "TOTAL_FAT(g)", "TOTAL_CARBS(g)", "TOTAL_PROTEIN(g)", "SERVING_SIZE", "LOCATION") FROM stdin;
1	Bacon, Egg, & Cheese Burrito	590	29	54	28	215g 	MARINA-BREAKFAST GRILL
2	Egg & Bacon Bagel	440	14	56	18	170g	MARINA-BREAKFAST GRILL
3	 Egg & Bacon English Muffin	290	14	28	13	110g	MARINA-BREAKFAST GRILL
4	 Egg & Cheese English Muffin 	310	16	28	14	120g	MARINA-BREAKFAST GRILL
5	 Egg, Cheese, & Ham English Muffin	330	16	28	17	140g	MARINA-BREAKFAST GRILL
6	 Fried Eggs 	150	10	1	12	90g	MARINA-BREAKFAST GRILL
7	 Scrambled Eggs 	180	12	3	16	178ml	MARINA-BREAKFAST GRILL
8	 Bacon	90	7	1	6	12g	MARINA-BREAKFAST GRILL
9	 Grilled Breakfast Ham	70	3	1	10	60g	MARINA-BREAKFAST GRILL
10	 Hash Browns	270	20	20	2	60g	MARINA-BREAKFAST GRILL
11	 Savoury Potatoes	390	29	31	3	148ml	MARINA-BREAKFAST GRILL
12	 Turkey Sandwich	240	6	32	15	140g	MARINA-EXPRESS STATION
13	 Fruit Cup 	80	0	20	1	220g	MARINA-EXPRESS STATION
14	 Caesar Salad 	410	39	12	8	175g	MARINA-EXPRESS STATION
15	Chicken Tenders	290	19	11	21	110g	MARINA-GRILL
16	 Ball Park Hot Dog	400	19	42	18	160g	MARINA-GRILL
17	 Crispy Chicken Sandwich	450	17	55	18	195g	MARINA-GRILL
18	 Philly Cheese Steak Sandwich	550	15	65	38	225g	MARINA-GRILL
19	 Classic Poutine	800	37	101	19	390g	MARINA-GRILL
20	 Fries-Large	610	24	91	9	230g	MARINA-GRILL
21	 Fries-Small	440	18	67	7	170g	MARINA-GRILL
22	 Sweet Potato Fries	870	62	73	5	205g	MARINA-GRILL
23	 Onion Rings	530	33	57	5	130g	MARINA-GRILL
24	Minestrone Soup	90	0.5	17	3	8oz	MARINA-SOUP STATION
25	 Mediterranean Chicken Salad	510	34	24	26	342g	MARINA-OPEN 1TOSS n ROLL
26	 Mediterranean Shrimp Salad	440	29	22	22	336g	MARINA-OPEN 1TOSS n ROLL
27	 Mediterranean Tofu Salad Cone	670	39	54	27	378g	MARINA-OPEN 1TOSS n ROLL
28	 Shrimp Summer Berry Salad	300	15	21	22	301g	MARINA-OPEN 1TOSS n ROLL
29	 Shrimp Summer Berry Salad Cone	570	28	54	28	323g	MARINA-OPEN 1TOSS n ROLL
30	 Tofu Summer Berry Salad	340	20	22	21	322g	MARINA-OPEN 1TOSS n ROLL
\.


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20180807185753_usersTable.js	1	2018-08-07 22:57:28.84-06
2	20180815120308_add_info_to_usersTable.js	2	2018-08-15 12:06:13.684-06
3	20180818131657_add_name_to_usersTable.js	3	2018-08-18 13:23:32.977-06
\.


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login (id, hash, email) FROM stdin;
1	$2a$10$J2L9EFPs2aWpSgWw5v251Op3oYc6I/KpLmiPeuFSJrC7pXMM8MfG.	john@gmail.com
4	$2a$10$dmmtpTAUapJb6sBNVotYWudLj/C3msqcCFk8KLRdz8/D6wH2IYQce	johan@gmail.com
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, joined, caloric_goals, daily_calorie, gender) FROM stdin;
2	Johnathon	johan@gmail.com	2018-08-03 13:39:23.139	0	0	\N
1	John	john@gmail.com	2018-08-02 12:43:21.086	1800	0	\N
\.


--
-- Data for Name: usersTable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."usersTable" (id, email, password_digest, created_at, updated_at, "daily_Calories", "firstName", "lastName") FROM stdin;
38	chowdhury.dhruba@hotmail.com	$2b$12$j1kQU/YtZtwiJ1arTKhq.ui17zAcD3wcCUdPYjMTqRg6Zgxs4mEYi	2018-08-16 12:50:01.603705-06	2018-08-16 12:50:01.603705-06	1800	\N	\N
39	j@gmailc.om	$2b$12$RuGOMzXRP9yz0oPVkumstuqELMRWHXWc3kKbOFclIPsbFkwNC.k2i	2018-08-16 12:55:22.443-06	2018-08-16 12:55:22.443-06	90023	\N	\N
40	hey@gmail.com	$2b$12$.XX3hYYh7ijXDvc4OC6Ss.u6lAtLpjxSS5CyR1k1AI19QbrquubcG	2018-08-16 14:50:06.852-06	2018-08-16 14:50:06.852-06	1000213	\N	\N
41	jk@gmail.com	$2b$12$L.FO3lE1EkTgzYwxozgDAutJmMnL7oZdgJZiCjClbcxd1weCMq0m2	2018-08-16 14:51:14.273-06	2018-08-16 14:51:14.273-06	1100	\N	\N
42	comeau@gmail.com	$2b$12$0YFg9SbrbT9qIm0ivKV82OTukd65uIYIlyMx1G6rriaGeV4ZdMI9.	2018-08-16 15:51:02.985-06	2018-08-16 15:51:02.985-06	102	\N	\N
1	john@gmail.com	$2b$12$uleymecUMjGDbBOSULy9EeXz/UglwMM1dLWBa4S7ZE4ojILFwhVUy	2018-08-15 12:06:13.639-06	2018-08-18 12:22:46.862-06	1800	\N	\N
\.


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 3, true);


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- Name: login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.login_id_seq', 4, true);


--
-- Name: usersTable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."usersTable_id_seq"', 42, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: Food Food_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Food"
    ADD CONSTRAINT "Food_pkey" PRIMARY KEY ("FOOD_ID");


--
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: login login_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_email_key UNIQUE (email);


--
-- Name: login login_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id);


--
-- Name: usersTable usersTable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."usersTable"
    ADD CONSTRAINT "usersTable_pkey" PRIMARY KEY (id);


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
-- PostgreSQL database dump complete
--

