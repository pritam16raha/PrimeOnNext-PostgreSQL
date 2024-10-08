--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE pritamdb;




--
-- Drop roles
--

DROP ROLE pritam;


--
-- Roles
--

CREATE ROLE pritam;
ALTER ROLE pritam WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:FAac4hsfFk/1UIL9cQ1Ptw==$gOHWO9MLBpu874b1ruQjK/JQhjfdrKJKwopqexQUhDM=:homYovaEOZ0WWRUw0XMY9okF4JszzlcSTgItJ34pEmY=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: pritam
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO pritam;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: pritam
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: pritam
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: pritam
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: pritam
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO pritam;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: pritam
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "pritamdb" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+1)

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

--
-- Name: pritamdb; Type: DATABASE; Schema: -; Owner: pritam
--

CREATE DATABASE pritamdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE pritamdb OWNER TO pritam;

\connect pritamdb

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
-- Name: Account; Type: TABLE; Schema: public; Owner: pritam
--

CREATE TABLE public."Account" (
    id text NOT NULL,
    "userId" text NOT NULL,
    type text NOT NULL,
    provider text NOT NULL,
    "providerAccountId" text NOT NULL,
    refresh_token text,
    access_token text,
    expires_at integer,
    token_type text,
    scope text,
    id_token text,
    session_state text
);


ALTER TABLE public."Account" OWNER TO pritam;

--
-- Name: Category; Type: TABLE; Schema: public; Owner: pritam
--

CREATE TABLE public."Category" (
    id text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    title text NOT NULL,
    "desc" text NOT NULL,
    type text NOT NULL,
    img text NOT NULL,
    slug text NOT NULL
);


ALTER TABLE public."Category" OWNER TO pritam;

--
-- Name: Order; Type: TABLE; Schema: public; Owner: pritam
--

CREATE TABLE public."Order" (
    id text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    price numeric(65,30) NOT NULL,
    products jsonb[],
    status text NOT NULL,
    intent_id text,
    "userEmail" text NOT NULL
);


ALTER TABLE public."Order" OWNER TO pritam;

--
-- Name: Product; Type: TABLE; Schema: public; Owner: pritam
--

CREATE TABLE public."Product" (
    id text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    title text NOT NULL,
    "desc" text NOT NULL,
    img text,
    price numeric(65,30) NOT NULL,
    "isFeatured" boolean DEFAULT false NOT NULL,
    options jsonb[],
    "catSlug" text NOT NULL
);


ALTER TABLE public."Product" OWNER TO pritam;

--
-- Name: Session; Type: TABLE; Schema: public; Owner: pritam
--

CREATE TABLE public."Session" (
    id text NOT NULL,
    "sessionToken" text NOT NULL,
    "userId" text NOT NULL,
    expires timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Session" OWNER TO pritam;

--
-- Name: User; Type: TABLE; Schema: public; Owner: pritam
--

CREATE TABLE public."User" (
    id text NOT NULL,
    name text,
    email text,
    "emailVerified" timestamp(3) without time zone,
    image text,
    "isAdmin" boolean DEFAULT false NOT NULL
);


ALTER TABLE public."User" OWNER TO pritam;

--
-- Name: VerificationToken; Type: TABLE; Schema: public; Owner: pritam
--

CREATE TABLE public."VerificationToken" (
    identifier text NOT NULL,
    token text NOT NULL,
    expires timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."VerificationToken" OWNER TO pritam;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: pritam
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO pritam;

--
-- Data for Name: Account; Type: TABLE DATA; Schema: public; Owner: pritam
--

COPY public."Account" (id, "userId", type, provider, "providerAccountId", refresh_token, access_token, expires_at, token_type, scope, id_token, session_state) FROM stdin;
cm181mhng0002xgwi0rkmsgt7	cm181mhnd0000xgwi9eq13ozz	oauth	google	108921157904109752891	\N	ya29.a0AcM612zpGBMihWs8vjHpPIW5fazOal_P-aNEbvIHGycx0-lPyhed2crw1gMtb7nBJwXmp_7mhAk_l0MGm_BJ9A-8RJcBYZnC1p50Vbex_zlxmGrzzULfNsRfC55ysoWFsyj5E65DM6p-pieng4SRzwFZG_ldugzPr68wpEGsaCgYKAR0SARMSFQHGX2MihxVkx4N0Zn9QaKjaKozbGQ0175	1726678449	Bearer	https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile openid	eyJhbGciOiJSUzI1NiIsImtpZCI6ImIyNjIwZDVlN2YxMzJiNTJhZmU4ODc1Y2RmMzc3NmMwNjQyNDlkMDQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI4NDQxODc3MjUwNDIta2IzaWhwM2tqZnR1bDQ5Njk4cjBkMmJuZG12dmQ5ZWMuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI4NDQxODc3MjUwNDIta2IzaWhwM2tqZnR1bDQ5Njk4cjBkMmJuZG12dmQ5ZWMuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDg5MjExNTc5MDQxMDk3NTI4OTEiLCJlbWFpbCI6InJhaGFwcml0YW0zMkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6IndEd2xHYl9LRlZfTWFZUkt4d3ZkdGciLCJuYW1lIjoiUHJpdGFtIFJhaGEiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jSU9vcGNZYjFUa1FiRjZ0dlBIY3VoR2NFS0ljWWFPaTJqQzBwSzFVdVdqM3U5TVJoRjI9czk2LWMiLCJnaXZlbl9uYW1lIjoiUHJpdGFtIiwiZmFtaWx5X25hbWUiOiJSYWhhIiwiaWF0IjoxNzI2Njc0OTAzLCJleHAiOjE3MjY2Nzg1MDN9.A_54PNbd7sk3FUFcKrUk9uwZO8_bXc4V4S5nLH0PktFrOoho1BYA-RZmiV8g0qzGbrsJG1_-HQcyhvYUKcTG6gzaOfDHif4_oAkei7zzQWgpFivIBfYH8Uus-oCQgsr5owrt1TBUM72YUiuL0NQh12MkFWWny8QMOxDKD-Ggp8ISurP2JrSPhTPA9ps997NBQ6r4KEKMLMnIuXC3AIMTmJBO8k4En_o4OLezrPt65DllPr73tsNV2-GKw22OGaDDZaZCXIFC99WuBw4ZGi217fws19iqlBJTZZkeONVo2BCqExIUkPR6XHEkkRWOyRPqUV_7w5otQ-vssrzKzZ01rA	\N
\.


--
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: pritam
--

COPY public."Category" (id, "createdAt", title, "desc", type, img, slug) FROM stdin;
cm181tv4c0000t3wclzwjzbnt	2024-09-18 15:59:54.828	Engine Parts	Description about engine	engine	/photos/category/engine.jpg	engine
cm181xkfz0003t3wcq1xlfl0q	2024-09-18 16:02:47.615	Performance Parts	Description about performance	performance	/photos/category/performance.webp	performance
cm181vpqs0001t3wcb3vy3dx9	2024-09-18 16:01:21.172	Body Parts	Description of body	body	/photos/category/body.jpg	body
\.


--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: pritam
--

COPY public."Order" (id, "createdAt", price, products, status, intent_id, "userEmail") FROM stdin;
cm1824jhb0003v5lhz2p6733s	2024-09-18 16:08:12.959	1099950.000000000000000000000000000000	{"{\\"id\\": \\"cm18228ed0000v5lh8q3n8aoe\\", \\"img\\": \\"https://res.cloudinary.com/pritam32raha/image/upload/v1726675637/zkyjr3aozrqlz77ifclj.jpg\\", \\"price\\": \\"1099950\\", \\"title\\": \\"RCB Suspension\\", \\"quantity\\": 1, \\"optionTitle\\": \\"delivery\\"}"}	Not Paid!	pi_3Q0QRESCPxF1Zilc1pluGz0b	rahapritam32@gmail.com
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: pritam
--

COPY public."Product" (id, "createdAt", title, "desc", img, price, "isFeatured", options, "catSlug") FROM stdin;
cm18228ed0000v5lh8q3n8aoe	2024-09-18 16:06:25.285	RCB Suspension	Make your ride more smooth with RCB suspension	https://res.cloudinary.com/pritam32raha/image/upload/v1726675637/zkyjr3aozrqlz77ifclj.jpg	10999.000000000000000000000000000000	f	{"{\\"title\\": \\"delivery\\", \\"additionalPrice\\": \\"50\\"}"}	body
\.


--
-- Data for Name: Session; Type: TABLE DATA; Schema: public; Owner: pritam
--

COPY public."Session" (id, "sessionToken", "userId", expires) FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: pritam
--

COPY public."User" (id, name, email, "emailVerified", image, "isAdmin") FROM stdin;
cm181mhnd0000xgwi9eq13ozz	Pritam Raha	rahapritam32@gmail.com	\N	https://lh3.googleusercontent.com/a/ACg8ocIOopcYb1TkQbF6tvPHcuhGcEKIcYaOi2jC0pK1UuWj3u9MRhF2=s96-c	t
\.


--
-- Data for Name: VerificationToken; Type: TABLE DATA; Schema: public; Owner: pritam
--

COPY public."VerificationToken" (identifier, token, expires) FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: pritam
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
ac277cc7-d8cc-4cc0-b0c1-e6711e907eb9	3d7ae2d94de92e4a904eeb8cdbf8437fc2de4618c84315ee65b0daea1cfb0bdc	2024-09-18 15:52:52.274248+00	20240913094750_first	\N	\N	2024-09-18 15:52:52.260631+00	1
7347d9c2-e3fe-4c8f-b86d-bf643ca7d335	03443aa2c04db1d5e53fa773f9d63d9c1ef38422b9328cd8f5969bb7bf1109f5	2024-09-18 15:52:52.289578+00	20240914143840_add_user	\N	\N	2024-09-18 15:52:52.275788+00	1
\.


--
-- Name: Account Account_pkey; Type: CONSTRAINT; Schema: public; Owner: pritam
--

ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_pkey" PRIMARY KEY (id);


--
-- Name: Category Category_pkey; Type: CONSTRAINT; Schema: public; Owner: pritam
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);


--
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: pritam
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: pritam
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- Name: Session Session_pkey; Type: CONSTRAINT; Schema: public; Owner: pritam
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: pritam
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: pritam
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Account_provider_providerAccountId_key; Type: INDEX; Schema: public; Owner: pritam
--

CREATE UNIQUE INDEX "Account_provider_providerAccountId_key" ON public."Account" USING btree (provider, "providerAccountId");


--
-- Name: Category_slug_key; Type: INDEX; Schema: public; Owner: pritam
--

CREATE UNIQUE INDEX "Category_slug_key" ON public."Category" USING btree (slug);


--
-- Name: Order_intent_id_key; Type: INDEX; Schema: public; Owner: pritam
--

CREATE UNIQUE INDEX "Order_intent_id_key" ON public."Order" USING btree (intent_id);


--
-- Name: Session_sessionToken_key; Type: INDEX; Schema: public; Owner: pritam
--

CREATE UNIQUE INDEX "Session_sessionToken_key" ON public."Session" USING btree ("sessionToken");


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: pritam
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: VerificationToken_identifier_token_key; Type: INDEX; Schema: public; Owner: pritam
--

CREATE UNIQUE INDEX "VerificationToken_identifier_token_key" ON public."VerificationToken" USING btree (identifier, token);


--
-- Name: VerificationToken_token_key; Type: INDEX; Schema: public; Owner: pritam
--

CREATE UNIQUE INDEX "VerificationToken_token_key" ON public."VerificationToken" USING btree (token);


--
-- Name: Account Account_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pritam
--

ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Order Order_userEmail_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pritam
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_userEmail_fkey" FOREIGN KEY ("userEmail") REFERENCES public."User"(email) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Product Product_catSlug_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pritam
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_catSlug_fkey" FOREIGN KEY ("catSlug") REFERENCES public."Category"(slug) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Session Session_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pritam
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

