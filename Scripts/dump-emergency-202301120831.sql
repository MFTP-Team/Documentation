--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2023-01-12 08:31:08

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

DROP DATABASE emergency;
--
-- TOC entry 3386 (class 1262 OID 16740)
-- Name: emergency; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE emergency WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_France.1252';


ALTER DATABASE emergency OWNER TO postgres;

\connect emergency

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 17006)
-- Name: alert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alert (
    id integer NOT NULL,
    date timestamp without time zone,
    longitude real,
    latitude real,
    intensity integer,
    id_fire integer,
    id_sensor character varying
);


ALTER TABLE public.alert OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17005)
-- Name: alert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alert_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alert_id_seq OWNER TO postgres;

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 209
-- Name: alert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alert_id_seq OWNED BY public.alert.id;


--
-- TOC entry 212 (class 1259 OID 17013)
-- Name: fire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fire (
    id integer NOT NULL,
    longitude real,
    latitude real,
    intensity integer,
    status smallint
);


ALTER TABLE public.fire OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17012)
-- Name: fire_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fire_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fire_id_seq OWNER TO postgres;

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 211
-- Name: fire_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fire_id_seq OWNED BY public.fire.id;


--
-- TOC entry 214 (class 1259 OID 17020)
-- Name: fireman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fireman (
    id integer NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    power integer,
    id_station integer,
    status character varying(30)
);


ALTER TABLE public.fireman OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17019)
-- Name: fireman_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fireman_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fireman_id_seq OWNER TO postgres;

--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 213
-- Name: fireman_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fireman_id_seq OWNED BY public.fireman.id;


--
-- TOC entry 222 (class 1259 OID 17052)
-- Name: fireman_intervention; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fireman_intervention (
    id_fireman integer NOT NULL,
    id_intervention integer NOT NULL
);


ALTER TABLE public.fireman_intervention OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17027)
-- Name: intervention; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intervention (
    id integer NOT NULL,
    date timestamp without time zone,
    status character varying(50),
    id_fire integer
);


ALTER TABLE public.intervention OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17026)
-- Name: intervention_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.intervention_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intervention_id_seq OWNER TO postgres;

--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 215
-- Name: intervention_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.intervention_id_seq OWNED BY public.intervention.id;


--
-- TOC entry 219 (class 1259 OID 17039)
-- Name: station; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.station (
    id integer NOT NULL,
    longitude real,
    latitude real
);


ALTER TABLE public.station OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17038)
-- Name: station_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.station_id_seq OWNER TO postgres;

--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 218
-- Name: station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.station_id_seq OWNED BY public.station.id;


--
-- TOC entry 221 (class 1259 OID 17046)
-- Name: truck; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.truck (
    id integer NOT NULL,
    longitude character varying(50),
    latitude character varying(50),
    power integer,
    id_station integer,
    status smallint
);


ALTER TABLE public.truck OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17045)
-- Name: truck_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.truck_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.truck_id_seq OWNER TO postgres;

--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 220
-- Name: truck_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.truck_id_seq OWNED BY public.truck.id;


--
-- TOC entry 217 (class 1259 OID 17033)
-- Name: truck_intervention; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.truck_intervention (
    id_truck integer NOT NULL,
    id_intervention integer NOT NULL
);


ALTER TABLE public.truck_intervention OWNER TO postgres;

--
-- TOC entry 3197 (class 2604 OID 17009)
-- Name: alert id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert ALTER COLUMN id SET DEFAULT nextval('public.alert_id_seq'::regclass);


--
-- TOC entry 3198 (class 2604 OID 17016)
-- Name: fire id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fire ALTER COLUMN id SET DEFAULT nextval('public.fire_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 17023)
-- Name: fireman id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fireman ALTER COLUMN id SET DEFAULT nextval('public.fireman_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 17030)
-- Name: intervention id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention ALTER COLUMN id SET DEFAULT nextval('public.intervention_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 17042)
-- Name: station id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station ALTER COLUMN id SET DEFAULT nextval('public.station_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 17049)
-- Name: truck id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.truck ALTER COLUMN id SET DEFAULT nextval('public.truck_id_seq'::regclass);


--
-- TOC entry 3368 (class 0 OID 17006)
-- Dependencies: 210
-- Data for Name: alert; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.alert VALUES (23, NULL, 4.843804, 45.76301, 2, NULL, NULL);
INSERT INTO public.alert VALUES (24, NULL, 4.843804, 45.76301, 2, NULL, NULL);
INSERT INTO public.alert VALUES (25, NULL, 4.8438, 45.763, 2, NULL, NULL);
INSERT INTO public.alert VALUES (26, NULL, 45.779224, 4.873045, NULL, NULL, NULL);
INSERT INTO public.alert VALUES (27, NULL, 45.779343, 4.8743243, NULL, NULL, NULL);
INSERT INTO public.alert VALUES (28, NULL, 45.77888, 4.8738613, NULL, NULL, NULL);
INSERT INTO public.alert VALUES (29, NULL, 45.779224, 4.873045, 1, NULL, NULL);
INSERT INTO public.alert VALUES (30, NULL, 45.779343, 4.8743243, 1, NULL, NULL);
INSERT INTO public.alert VALUES (31, NULL, 45.77888, 4.8738613, 1, NULL, NULL);
INSERT INTO public.alert VALUES (32, NULL, 45.779224, 4.873045, 1, NULL, NULL);
INSERT INTO public.alert VALUES (33, NULL, 45.779343, 4.8743243, 1, NULL, NULL);
INSERT INTO public.alert VALUES (34, NULL, 45.77888, 4.8738613, 1, NULL, NULL);
INSERT INTO public.alert VALUES (35, NULL, 45.779224, 4.873045, 1, NULL, NULL);
INSERT INTO public.alert VALUES (36, NULL, 45.779343, 4.8743243, 1, NULL, NULL);
INSERT INTO public.alert VALUES (37, NULL, 45.77888, 4.8738613, 1, NULL, NULL);
INSERT INTO public.alert VALUES (38, NULL, 45.779224, 4.873045, 1, NULL, NULL);
INSERT INTO public.alert VALUES (39, NULL, 45.779343, 4.8743243, 1, NULL, NULL);
INSERT INTO public.alert VALUES (40, NULL, 45.77888, 4.8738613, 1, NULL, NULL);
INSERT INTO public.alert VALUES (41, NULL, 45.779224, 4.873045, 1, NULL, NULL);
INSERT INTO public.alert VALUES (42, NULL, 45.779343, 4.8743243, 1, NULL, NULL);
INSERT INTO public.alert VALUES (43, NULL, 45.77888, 4.8738613, 1, NULL, NULL);


--
-- TOC entry 3370 (class 0 OID 17013)
-- Dependencies: 212
-- Data for Name: fire; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fire VALUES (1, 4.843804, 45.76301, 2, NULL);
INSERT INTO public.fire VALUES (2, 4.843804, 45.76301, 2, 0);
INSERT INTO public.fire VALUES (3, 4.843804, 45.76301, 2, 1);
INSERT INTO public.fire VALUES (4, 4.843804, 45.76301, 2, 2);
INSERT INTO public.fire VALUES (5, 4.843804, 45.76301, 2, 0);
INSERT INTO public.fire VALUES (6, 4.873045, 45.779224, 6017, NULL);
INSERT INTO public.fire VALUES (7, 4.8738613, 45.77888, 6017, NULL);


--
-- TOC entry 3372 (class 0 OID 17020)
-- Dependencies: 214
-- Data for Name: fireman; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fireman VALUES (1, 'Damien', 'François', 3, 1, NULL);


--
-- TOC entry 3380 (class 0 OID 17052)
-- Dependencies: 222
-- Data for Name: fireman_intervention; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3374 (class 0 OID 17027)
-- Dependencies: 216
-- Data for Name: intervention; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.intervention VALUES (7, '2023-01-03 14:36:22.249', '0', 5);
INSERT INTO public.intervention VALUES (8, '2023-01-12 00:32:26.343', '0', 6);
INSERT INTO public.intervention VALUES (9, '2023-01-12 00:44:24.804', '0', 7);


--
-- TOC entry 3377 (class 0 OID 17039)
-- Dependencies: 219
-- Data for Name: station; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.station VALUES (1, 2, 3);
INSERT INTO public.station VALUES (2, 4.843804, 45.76301);
INSERT INTO public.station VALUES (3, 4.8214207, 45.784164);
INSERT INTO public.station VALUES (4, 4.848066, 45.749928);
INSERT INTO public.station VALUES (5, 4.843804, 45.76301);
INSERT INTO public.station VALUES (6, 4.9056506, 45.765385);
INSERT INTO public.station VALUES (7, 4.878167, 45.77897);


--
-- TOC entry 3379 (class 0 OID 17046)
-- Dependencies: 221
-- Data for Name: truck; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.truck VALUES (4, '4.843804', '45.76301', 2, 1, 0);
INSERT INTO public.truck VALUES (5, '4.843804', '45.76301', 2, 1, 0);
INSERT INTO public.truck VALUES (1, '4.843804', '45.76301', 2, 1, 0);
INSERT INTO public.truck VALUES (2, '4.843804', '45.76301', 2, 1, 1);
INSERT INTO public.truck VALUES (3, '4.843804', '45.76301', 2, 1, 1);


--
-- TOC entry 3375 (class 0 OID 17033)
-- Dependencies: 217
-- Data for Name: truck_intervention; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.truck_intervention VALUES (2, 7);
INSERT INTO public.truck_intervention VALUES (3, 7);


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 209
-- Name: alert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alert_id_seq', 43, true);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 211
-- Name: fire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fire_id_seq', 7, true);


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 213
-- Name: fireman_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fireman_id_seq', 1, true);


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 215
-- Name: intervention_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.intervention_id_seq', 9, true);


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 218
-- Name: station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.station_id_seq', 7, true);


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 220
-- Name: truck_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.truck_id_seq', 5, true);


--
-- TOC entry 3204 (class 2606 OID 17011)
-- Name: alert alert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert
    ADD CONSTRAINT alert_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 17018)
-- Name: fire fire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fire
    ADD CONSTRAINT fire_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 17056)
-- Name: fireman_intervention fireman_intervention_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fireman_intervention
    ADD CONSTRAINT fireman_intervention_pkey PRIMARY KEY (id_fireman, id_intervention);


--
-- TOC entry 3208 (class 2606 OID 17025)
-- Name: fireman fireman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fireman
    ADD CONSTRAINT fireman_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 17032)
-- Name: intervention intervention_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT intervention_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 17044)
-- Name: station station_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT station_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 17037)
-- Name: truck_intervention truck_intervention_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.truck_intervention
    ADD CONSTRAINT truck_intervention_pkey PRIMARY KEY (id_truck, id_intervention);


--
-- TOC entry 3216 (class 2606 OID 17051)
-- Name: truck truck_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.truck
    ADD CONSTRAINT truck_pkey PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 17057)
-- Name: alert alert_id_fire_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert
    ADD CONSTRAINT alert_id_fire_fkey FOREIGN KEY (id_fire) REFERENCES public.fire(id);


--
-- TOC entry 3220 (class 2606 OID 17067)
-- Name: fireman fireman_id_station_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fireman
    ADD CONSTRAINT fireman_id_station_fkey FOREIGN KEY (id_station) REFERENCES public.station(id);


--
-- TOC entry 3225 (class 2606 OID 17087)
-- Name: fireman_intervention fireman_intervention_id_fireman_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fireman_intervention
    ADD CONSTRAINT fireman_intervention_id_fireman_fkey FOREIGN KEY (id_fireman) REFERENCES public.fireman(id);


--
-- TOC entry 3226 (class 2606 OID 17092)
-- Name: fireman_intervention fireman_intervention_id_intervention_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fireman_intervention
    ADD CONSTRAINT fireman_intervention_id_intervention_fkey FOREIGN KEY (id_intervention) REFERENCES public.intervention(id);


--
-- TOC entry 3227 (class 2606 OID 17180)
-- Name: fireman_intervention fireman_intervention_id_intervention_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fireman_intervention
    ADD CONSTRAINT fireman_intervention_id_intervention_fkey1 FOREIGN KEY (id_intervention) REFERENCES public.intervention(id);


--
-- TOC entry 3221 (class 2606 OID 17062)
-- Name: intervention intervention_id_fire_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT intervention_id_fire_fkey FOREIGN KEY (id_fire) REFERENCES public.fire(id);


--
-- TOC entry 3224 (class 2606 OID 17082)
-- Name: truck truck_id_station_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.truck
    ADD CONSTRAINT truck_id_station_fkey FOREIGN KEY (id_station) REFERENCES public.station(id);


--
-- TOC entry 3223 (class 2606 OID 17077)
-- Name: truck_intervention truck_intervention_id_intervention_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.truck_intervention
    ADD CONSTRAINT truck_intervention_id_intervention_fkey FOREIGN KEY (id_intervention) REFERENCES public.intervention(id);


--
-- TOC entry 3222 (class 2606 OID 17072)
-- Name: truck_intervention truck_intervention_id_truck_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.truck_intervention
    ADD CONSTRAINT truck_intervention_id_truck_fkey FOREIGN KEY (id_truck) REFERENCES public.truck(id);


-- Completed on 2023-01-12 08:31:09

--
-- PostgreSQL database dump complete
--

