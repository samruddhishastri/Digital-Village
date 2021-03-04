--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15 (Ubuntu 10.15-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.15 (Ubuntu 10.15-0ubuntu0.18.04.1)

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
-- Name: announcement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.announcement (
    announcement_id integer NOT NULL,
    name character varying(100),
    description character varying(1000),
    validtill date,
    format character varying(100),
    link character varying(1000),
    CONSTRAINT announcement_format_check CHECK (((format)::text = ANY ((ARRAY['video'::character varying, 'audio'::character varying, 'text'::character varying])::text[])))
);


ALTER TABLE public.announcement OWNER TO postgres;

--
-- Name: announcement_announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.announcement_announcement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.announcement_announcement_id_seq OWNER TO postgres;

--
-- Name: announcement_announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.announcement_announcement_id_seq OWNED BY public.announcement.announcement_id;


--
-- Name: application_forms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_forms (
    form_id integer NOT NULL,
    name character varying(200),
    description character varying(1500),
    attachmentlink character varying(1000)
);


ALTER TABLE public.application_forms OWNER TO postgres;

--
-- Name: application_forms_form_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.application_forms_form_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.application_forms_form_id_seq OWNER TO postgres;

--
-- Name: application_forms_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.application_forms_form_id_seq OWNED BY public.application_forms.form_id;


--
-- Name: complaints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complaints (
    complaint_id integer NOT NULL,
    name character varying(150),
    description character varying(1000),
    attachmentlink character varying(1000),
    status character varying(50),
    notes character varying(1000),
    category character varying(200),
    CONSTRAINT complaints_status_check CHECK (((status)::text = ANY ((ARRAY['open
'::character varying, 'inprogress'::character varying, 'closed'::character varying])::text[])))
);


ALTER TABLE public.complaints OWNER TO postgres;

--
-- Name: complaints_complaint_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.complaints_complaint_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.complaints_complaint_id_seq OWNER TO postgres;

--
-- Name: complaints_complaint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.complaints_complaint_id_seq OWNED BY public.complaints.complaint_id;


--
-- Name: dv_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dv_user (
    dv_user_id integer NOT NULL,
    username character varying(150) NOT NULL,
    password character varying(150) NOT NULL,
    ispasswordreset boolean NOT NULL,
    loginrequired boolean,
    scandumpdata character varying(1000)
);


ALTER TABLE public.dv_user OWNER TO postgres;

--
-- Name: dv_user_dv_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dv_user_dv_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dv_user_dv_user_id_seq OWNER TO postgres;

--
-- Name: dv_user_dv_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dv_user_dv_user_id_seq OWNED BY public.dv_user.dv_user_id;


--
-- Name: payment_reminders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_reminders (
    payment_id integer NOT NULL,
    category character varying(200),
    name character varying(200),
    description character varying(1500),
    frequency character varying(100),
    amount bigint,
    generated boolean,
    year bigint,
    CONSTRAINT payment_reminders_frequency_check CHECK (((frequency)::text = ANY ((ARRAY['yearly'::character varying, 'monthly'::character varying, 'quarterly'::character varying])::text[])))
);


ALTER TABLE public.payment_reminders OWNER TO postgres;

--
-- Name: payment_reminders_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_reminders_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_reminders_payment_id_seq OWNER TO postgres;

--
-- Name: payment_reminders_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_reminders_payment_id_seq OWNED BY public.payment_reminders.payment_id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    role_id integer NOT NULL,
    name character varying(150)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_role_id_seq OWNER TO postgres;

--
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_role_id_seq OWNED BY public.role.role_id;


--
-- Name: user_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_address (
    user_address_id integer NOT NULL,
    dv_user_id integer,
    user_details_id integer,
    houseno character varying(200),
    wardno character varying(200),
    street character varying(200),
    pin character varying(200),
    landmark character varying(300)
);


ALTER TABLE public.user_address OWNER TO postgres;

--
-- Name: user_address_user_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_address_user_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_address_user_address_id_seq OWNER TO postgres;

--
-- Name: user_address_user_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_address_user_address_id_seq OWNED BY public.user_address.user_address_id;


--
-- Name: user_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_details (
    user_details_id integer NOT NULL,
    dv_user_id integer,
    firstname character varying(150) NOT NULL,
    lastname character varying(150),
    aadhaarno bigint,
    mobileno bigint,
    dob date,
    user_address_id integer
);


ALTER TABLE public.user_details OWNER TO postgres;

--
-- Name: user_details_user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_details_user_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_details_user_details_id_seq OWNER TO postgres;

--
-- Name: user_details_user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_details_user_details_id_seq OWNED BY public.user_details.user_details_id;


--
-- Name: user_payments_reminders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_payments_reminders (
    user_payments_id integer NOT NULL,
    payment_id integer,
    user_address_id integer,
    status character varying(200),
    totalamount real,
    paid real,
    balance real,
    duedate date,
    notes character varying(1500)
);


ALTER TABLE public.user_payments_reminders OWNER TO postgres;

--
-- Name: user_payments_reminders_user_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_payments_reminders_user_payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_payments_reminders_user_payments_id_seq OWNER TO postgres;

--
-- Name: user_payments_reminders_user_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_payments_reminders_user_payments_id_seq OWNED BY public.user_payments_reminders.user_payments_id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_role_id integer NOT NULL,
    role_id integer,
    user_id integer
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: user_roles_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_roles_user_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_roles_user_role_id_seq OWNER TO postgres;

--
-- Name: user_roles_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_roles_user_role_id_seq OWNED BY public.user_roles.user_role_id;


--
-- Name: ward_representative; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ward_representative (
    ward_rep_id integer NOT NULL,
    user_id integer,
    wardno bigint
);


ALTER TABLE public.ward_representative OWNER TO postgres;

--
-- Name: ward_representative_ward_rep_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ward_representative_ward_rep_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ward_representative_ward_rep_id_seq OWNER TO postgres;

--
-- Name: ward_representative_ward_rep_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ward_representative_ward_rep_id_seq OWNED BY public.ward_representative.ward_rep_id;


--
-- Name: announcement announcement_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.announcement ALTER COLUMN announcement_id SET DEFAULT nextval('public.announcement_announcement_id_seq'::regclass);


--
-- Name: application_forms form_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_forms ALTER COLUMN form_id SET DEFAULT nextval('public.application_forms_form_id_seq'::regclass);


--
-- Name: complaints complaint_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaints ALTER COLUMN complaint_id SET DEFAULT nextval('public.complaints_complaint_id_seq'::regclass);


--
-- Name: dv_user dv_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dv_user ALTER COLUMN dv_user_id SET DEFAULT nextval('public.dv_user_dv_user_id_seq'::regclass);


--
-- Name: payment_reminders payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_reminders ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_reminders_payment_id_seq'::regclass);


--
-- Name: role role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN role_id SET DEFAULT nextval('public.role_role_id_seq'::regclass);


--
-- Name: user_address user_address_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address ALTER COLUMN user_address_id SET DEFAULT nextval('public.user_address_user_address_id_seq'::regclass);


--
-- Name: user_details user_details_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details ALTER COLUMN user_details_id SET DEFAULT nextval('public.user_details_user_details_id_seq'::regclass);


--
-- Name: user_payments_reminders user_payments_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_payments_reminders ALTER COLUMN user_payments_id SET DEFAULT nextval('public.user_payments_reminders_user_payments_id_seq'::regclass);


--
-- Name: user_roles user_role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles ALTER COLUMN user_role_id SET DEFAULT nextval('public.user_roles_user_role_id_seq'::regclass);


--
-- Name: ward_representative ward_rep_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ward_representative ALTER COLUMN ward_rep_id SET DEFAULT nextval('public.ward_representative_ward_rep_id_seq'::regclass);


--
-- Data for Name: announcement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.announcement (announcement_id, name, description, validtill, format, link) FROM stdin;
\.


--
-- Data for Name: application_forms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_forms (form_id, name, description, attachmentlink) FROM stdin;
\.


--
-- Data for Name: complaints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complaints (complaint_id, name, description, attachmentlink, status, notes, category) FROM stdin;
\.


--
-- Data for Name: dv_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dv_user (dv_user_id, username, password, ispasswordreset, loginrequired, scandumpdata) FROM stdin;
\.


--
-- Data for Name: payment_reminders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_reminders (payment_id, category, name, description, frequency, amount, generated, year) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (role_id, name) FROM stdin;
\.


--
-- Data for Name: user_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_address (user_address_id, dv_user_id, user_details_id, houseno, wardno, street, pin, landmark) FROM stdin;
\.


--
-- Data for Name: user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_details (user_details_id, dv_user_id, firstname, lastname, aadhaarno, mobileno, dob, user_address_id) FROM stdin;
\.


--
-- Data for Name: user_payments_reminders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_payments_reminders (user_payments_id, payment_id, user_address_id, status, totalamount, paid, balance, duedate, notes) FROM stdin;
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_role_id, role_id, user_id) FROM stdin;
\.


--
-- Data for Name: ward_representative; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ward_representative (ward_rep_id, user_id, wardno) FROM stdin;
\.


--
-- Name: announcement_announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.announcement_announcement_id_seq', 1, false);


--
-- Name: application_forms_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.application_forms_form_id_seq', 1, false);


--
-- Name: complaints_complaint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complaints_complaint_id_seq', 1, false);


--
-- Name: dv_user_dv_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dv_user_dv_user_id_seq', 1, false);


--
-- Name: payment_reminders_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_reminders_payment_id_seq', 1, false);


--
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_role_id_seq', 1, false);


--
-- Name: user_address_user_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_address_user_address_id_seq', 1, false);


--
-- Name: user_details_user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_details_user_details_id_seq', 1, false);


--
-- Name: user_payments_reminders_user_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_payments_reminders_user_payments_id_seq', 1, false);


--
-- Name: user_roles_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_roles_user_role_id_seq', 1, false);


--
-- Name: ward_representative_ward_rep_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ward_representative_ward_rep_id_seq', 1, false);


--
-- Name: announcement announcement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.announcement
    ADD CONSTRAINT announcement_pkey PRIMARY KEY (announcement_id);


--
-- Name: application_forms application_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_forms
    ADD CONSTRAINT application_forms_pkey PRIMARY KEY (form_id);


--
-- Name: complaints complaints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaints
    ADD CONSTRAINT complaints_pkey PRIMARY KEY (complaint_id);


--
-- Name: dv_user dv_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dv_user
    ADD CONSTRAINT dv_user_pkey PRIMARY KEY (dv_user_id);


--
-- Name: payment_reminders payment_reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_reminders
    ADD CONSTRAINT payment_reminders_pkey PRIMARY KEY (payment_id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- Name: user_address user_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT user_address_pkey PRIMARY KEY (user_address_id);


--
-- Name: user_details user_details_aadhaarno_mobileno_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_aadhaarno_mobileno_key UNIQUE (aadhaarno, mobileno);


--
-- Name: user_details user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (user_details_id);


--
-- Name: user_payments_reminders user_payments_reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_payments_reminders
    ADD CONSTRAINT user_payments_reminders_pkey PRIMARY KEY (user_payments_id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_role_id);


--
-- Name: ward_representative ward_representative_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ward_representative
    ADD CONSTRAINT ward_representative_pkey PRIMARY KEY (ward_rep_id);


--
-- Name: user_payments_reminders fk_payrem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_payments_reminders
    ADD CONSTRAINT fk_payrem FOREIGN KEY (payment_id) REFERENCES public.payment_reminders(payment_id);


--
-- Name: user_roles fk_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_roles FOREIGN KEY (role_id) REFERENCES public.role(role_id);


--
-- Name: user_payments_reminders fk_useraddress; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_payments_reminders
    ADD CONSTRAINT fk_useraddress FOREIGN KEY (user_address_id) REFERENCES public.user_address(user_address_id);


--
-- Name: user_details fk_useraddress; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT fk_useraddress FOREIGN KEY (user_address_id) REFERENCES public.user_address(user_address_id);


--
-- Name: user_address fk_userdetails; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT fk_userdetails FOREIGN KEY (user_details_id) REFERENCES public.user_details(user_details_id);


--
-- Name: user_address fk_userid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT fk_userid FOREIGN KEY (dv_user_id) REFERENCES public.dv_user(dv_user_id);


--
-- Name: user_details fk_userid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT fk_userid FOREIGN KEY (dv_user_id) REFERENCES public.dv_user(dv_user_id);


--
-- Name: user_roles userid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT userid FOREIGN KEY (user_id) REFERENCES public.dv_user(dv_user_id);


--
-- Name: ward_representative userid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ward_representative
    ADD CONSTRAINT userid FOREIGN KEY (user_id) REFERENCES public.dv_user(dv_user_id);


--
-- PostgreSQL database dump complete
--

