--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-01-08 22:55:35 CET

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
-- TOC entry 7 (class 2615 OID 16407)
-- Name: auctions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA auctions;


ALTER SCHEMA auctions OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 16581)
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA auctions;


--
-- TOC entry 3716 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16493)
-- Name: app_user; Type: TABLE; Schema: auctions; Owner: postgres
--

CREATE TABLE auctions.app_user (
    id bigint NOT NULL,
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    password character varying(255),
    phone_number character varying(255),
    role character varying(255),
    address character varying(255),
    city character varying(255),
    country character varying(255),
    credit_card_number character varying(255),
    zip_code character varying(255),
    date_of_birth timestamp(6) with time zone,
    credit_card character varying(255),
    photo_url character varying(255),
    authentication_method character varying(255),
    deleted boolean
);


ALTER TABLE auctions.app_user OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16492)
-- Name: app_user_id_seq; Type: SEQUENCE; Schema: auctions; Owner: postgres
--

CREATE SEQUENCE auctions.app_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auctions.app_user_id_seq OWNER TO postgres;

--
-- TOC entry 3717 (class 0 OID 0)
-- Dependencies: 217
-- Name: app_user_id_seq; Type: SEQUENCE OWNED BY; Schema: auctions; Owner: postgres
--

ALTER SEQUENCE auctions.app_user_id_seq OWNED BY auctions.app_user.id;


--
-- TOC entry 228 (class 1259 OID 16550)
-- Name: bid; Type: TABLE; Schema: auctions; Owner: postgres
--

CREATE TABLE auctions.bid (
    id bigint NOT NULL,
    bid double precision,
    date_created timestamp(6) without time zone,
    product_id bigint,
    bidder_id bigint,
    deleted boolean
);


ALTER TABLE auctions.bid OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16549)
-- Name: bid_id_seq; Type: SEQUENCE; Schema: auctions; Owner: postgres
--

CREATE SEQUENCE auctions.bid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auctions.bid_id_seq OWNER TO postgres;

--
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 227
-- Name: bid_id_seq; Type: SEQUENCE OWNED BY; Schema: auctions; Owner: postgres
--

ALTER SEQUENCE auctions.bid_id_seq OWNED BY auctions.bid.id;


--
-- TOC entry 220 (class 1259 OID 16502)
-- Name: category; Type: TABLE; Schema: auctions; Owner: postgres
--

CREATE TABLE auctions.category (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE auctions.category OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16501)
-- Name: category_id_seq; Type: SEQUENCE; Schema: auctions; Owner: postgres
--

CREATE SEQUENCE auctions.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auctions.category_id_seq OWNER TO postgres;

--
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 219
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: auctions; Owner: postgres
--

ALTER SEQUENCE auctions.category_id_seq OWNED BY auctions.category.id;


--
-- TOC entry 231 (class 1259 OID 16602)
-- Name: payment; Type: TABLE; Schema: auctions; Owner: postgres
--

CREATE TABLE auctions.payment (
    id bigint NOT NULL,
    date_created timestamp(6) with time zone,
    bid_id bigint,
    session_id character varying(255)
);


ALTER TABLE auctions.payment OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16601)
-- Name: payment_id_seq; Type: SEQUENCE; Schema: auctions; Owner: postgres
--

CREATE SEQUENCE auctions.payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auctions.payment_id_seq OWNER TO postgres;

--
-- TOC entry 3720 (class 0 OID 0)
-- Dependencies: 230
-- Name: payment_id_seq; Type: SEQUENCE OWNED BY; Schema: auctions; Owner: postgres
--

ALTER SEQUENCE auctions.payment_id_seq OWNED BY auctions.payment.id;


--
-- TOC entry 222 (class 1259 OID 16509)
-- Name: product; Type: TABLE; Schema: auctions; Owner: postgres
--

CREATE TABLE auctions.product (
    id bigint NOT NULL,
    date_created timestamp(6) without time zone,
    date_end timestamp(6) without time zone,
    date_start timestamp(6) without time zone,
    highest_bid double precision,
    number_of_bids integer,
    start_bid double precision,
    subcategory_id bigint,
    seller_id bigint,
    description character varying(255),
    name character varying(255),
    address character varying(255),
    city character varying(255),
    country character varying(255),
    email character varying(255),
    phone_number character varying(255),
    zip_code character varying(255),
    purchased boolean,
    CONSTRAINT chk_end_after_start CHECK ((date_end >= date_start))
);


ALTER TABLE auctions.product OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16508)
-- Name: product_id_seq; Type: SEQUENCE; Schema: auctions; Owner: postgres
--

CREATE SEQUENCE auctions.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auctions.product_id_seq OWNER TO postgres;

--
-- TOC entry 3721 (class 0 OID 0)
-- Dependencies: 221
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: auctions; Owner: postgres
--

ALTER SEQUENCE auctions.product_id_seq OWNED BY auctions.product.id;


--
-- TOC entry 224 (class 1259 OID 16516)
-- Name: product_image; Type: TABLE; Schema: auctions; Owner: postgres
--

CREATE TABLE auctions.product_image (
    id bigint NOT NULL,
    url character varying(255),
    product_id bigint
);


ALTER TABLE auctions.product_image OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16515)
-- Name: product_image_id_seq; Type: SEQUENCE; Schema: auctions; Owner: postgres
--

CREATE SEQUENCE auctions.product_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auctions.product_image_id_seq OWNER TO postgres;

--
-- TOC entry 3722 (class 0 OID 0)
-- Dependencies: 223
-- Name: product_image_id_seq; Type: SEQUENCE OWNED BY; Schema: auctions; Owner: postgres
--

ALTER SEQUENCE auctions.product_image_id_seq OWNED BY auctions.product_image.id;


--
-- TOC entry 226 (class 1259 OID 16523)
-- Name: sub_category; Type: TABLE; Schema: auctions; Owner: postgres
--

CREATE TABLE auctions.sub_category (
    id bigint NOT NULL,
    name character varying(255),
    category_id bigint,
    product_count bigint
);


ALTER TABLE auctions.sub_category OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16522)
-- Name: sub_category_id_seq; Type: SEQUENCE; Schema: auctions; Owner: postgres
--

CREATE SEQUENCE auctions.sub_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auctions.sub_category_id_seq OWNER TO postgres;

--
-- TOC entry 3723 (class 0 OID 0)
-- Dependencies: 225
-- Name: sub_category_id_seq; Type: SEQUENCE OWNED BY; Schema: auctions; Owner: postgres
--

ALTER SEQUENCE auctions.sub_category_id_seq OWNED BY auctions.sub_category.id;


--
-- TOC entry 233 (class 1259 OID 16617)
-- Name: user_seller_interaction; Type: TABLE; Schema: auctions; Owner: postgres
--

CREATE TABLE auctions.user_seller_interaction (
    id bigint NOT NULL,
    interacted_with_counter bigint NOT NULL,
    last_interacted_with timestamp(6) with time zone,
    views bigint NOT NULL,
    seller_id bigint,
    user_id bigint
);


ALTER TABLE auctions.user_seller_interaction OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16616)
-- Name: user_seller_interaction_id_seq; Type: SEQUENCE; Schema: auctions; Owner: postgres
--

CREATE SEQUENCE auctions.user_seller_interaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auctions.user_seller_interaction_id_seq OWNER TO postgres;

--
-- TOC entry 3724 (class 0 OID 0)
-- Dependencies: 232
-- Name: user_seller_interaction_id_seq; Type: SEQUENCE OWNED BY; Schema: auctions; Owner: postgres
--

ALTER SEQUENCE auctions.user_seller_interaction_id_seq OWNED BY auctions.user_seller_interaction.id;


--
-- TOC entry 235 (class 1259 OID 16624)
-- Name: user_subcategory_interaction; Type: TABLE; Schema: auctions; Owner: postgres
--

CREATE TABLE auctions.user_subcategory_interaction (
    id bigint NOT NULL,
    interacted_with_counter bigint NOT NULL,
    last_interacted_with timestamp(6) with time zone,
    views bigint NOT NULL,
    subcategory_id bigint,
    user_id bigint
);


ALTER TABLE auctions.user_subcategory_interaction OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16623)
-- Name: user_subcategory_interaction_id_seq; Type: SEQUENCE; Schema: auctions; Owner: postgres
--

CREATE SEQUENCE auctions.user_subcategory_interaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auctions.user_subcategory_interaction_id_seq OWNER TO postgres;

--
-- TOC entry 3725 (class 0 OID 0)
-- Dependencies: 234
-- Name: user_subcategory_interaction_id_seq; Type: SEQUENCE OWNED BY; Schema: auctions; Owner: postgres
--

ALTER SEQUENCE auctions.user_subcategory_interaction_id_seq OWNED BY auctions.user_subcategory_interaction.id;


--
-- TOC entry 229 (class 1259 OID 16566)
-- Name: wishlist; Type: TABLE; Schema: auctions; Owner: postgres
--

CREATE TABLE auctions.wishlist (
    user_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE auctions.wishlist OWNER TO postgres;

--
-- TOC entry 3500 (class 2604 OID 16496)
-- Name: app_user id; Type: DEFAULT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.app_user ALTER COLUMN id SET DEFAULT nextval('auctions.app_user_id_seq'::regclass);


--
-- TOC entry 3505 (class 2604 OID 16553)
-- Name: bid id; Type: DEFAULT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.bid ALTER COLUMN id SET DEFAULT nextval('auctions.bid_id_seq'::regclass);


--
-- TOC entry 3501 (class 2604 OID 16505)
-- Name: category id; Type: DEFAULT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.category ALTER COLUMN id SET DEFAULT nextval('auctions.category_id_seq'::regclass);


--
-- TOC entry 3506 (class 2604 OID 16605)
-- Name: payment id; Type: DEFAULT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.payment ALTER COLUMN id SET DEFAULT nextval('auctions.payment_id_seq'::regclass);


--
-- TOC entry 3502 (class 2604 OID 16512)
-- Name: product id; Type: DEFAULT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.product ALTER COLUMN id SET DEFAULT nextval('auctions.product_id_seq'::regclass);


--
-- TOC entry 3503 (class 2604 OID 16519)
-- Name: product_image id; Type: DEFAULT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.product_image ALTER COLUMN id SET DEFAULT nextval('auctions.product_image_id_seq'::regclass);


--
-- TOC entry 3504 (class 2604 OID 16526)
-- Name: sub_category id; Type: DEFAULT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.sub_category ALTER COLUMN id SET DEFAULT nextval('auctions.sub_category_id_seq'::regclass);


--
-- TOC entry 3507 (class 2604 OID 16620)
-- Name: user_seller_interaction id; Type: DEFAULT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.user_seller_interaction ALTER COLUMN id SET DEFAULT nextval('auctions.user_seller_interaction_id_seq'::regclass);


--
-- TOC entry 3508 (class 2604 OID 16627)
-- Name: user_subcategory_interaction id; Type: DEFAULT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.user_subcategory_interaction ALTER COLUMN id SET DEFAULT nextval('auctions.user_subcategory_interaction_id_seq'::regclass);


--
-- TOC entry 3693 (class 0 OID 16493)
-- Dependencies: 218
-- Data for Name: app_user; Type: TABLE DATA; Schema: auctions; Owner: postgres
--

INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (34, 'delete1@test.com', 'Emir', 'Kapic', '$2a$10$SxHJdPw0NIfeVEH/RmkPIuxrEL4Z7v5gMTWJeJVJGK0xK7r93vNaO', NULL, 'ROLE_USER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (36, 'delete5@test.com', 'Emir', 'Kapic', '$2a$10$htwLj4pSG7sfS8GClNUp/utUyxDUMeh8vxESCUs2SDosZ4noZ4cVu', NULL, 'ROLE_USER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (15, 'test132@test.ba', 'Emir', '', '$2a$10$CFfIvSZlLiEZ0JD6xobbyOBwFqBXBZEWCbPhVvXcV1qeUhf8L8N0O', NULL, 'ROLE_USER', NULL, NULL, NULL, NULL, NULL, '2002-03-04 16:00:00+01', '123', NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (2, 'ekapic1@etf.unsa.ba', 'Emir', 'Kapic', '$2a$10$.OeQBGmyoEisqGlZ3Yni8eyibW5aOpj7Jsxy.D1hIt2kChdcTEwVm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (5, 'test@test.ba', 'Emir', 'Kapic', '$2a$10$tDZqIIM0wd1pCuKHdCwHXuYCis8z970QuthpgJd/1h7m2XERRm6U.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (7, 'ekesfs@etf.unsa.ba', 'test1', 'test2', '$2a$10$lGgNkEv3KRDjR5.qSNkbUePDUTZmit.JRQINKolbGWmK3D/s34A9y', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (8, 'ekesfssdad@etf.unsa.ba', 'test1', 'test2', '$2a$10$uuheBR7Kyu4NpwVBLxLvGOTDFUejkwVsYSWRhvZd/ik.EknE674V6', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (9, 'ekapic13@etf.unsa.ba', 'test', 'test1', '$2a$10$kvs/fGOJHoBbrgSOfdG9QOqIx9n1vGHVOboanWc8CmwhqJ07xX6/6', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (23, 'test4@test.com', 'Emir12', 'Kapic', '$2a$10$2RYx7SBW53y.IYpH7M3GPu5Svy09jiQaTVPHVxnLMSwVAteUY97Hi', '+123', 'ROLE_USER', 'myaddress', 'Sarajevo', 'Bosnia & Herzegovina', '2233123', '71000', '2013-04-30 16:00:00+02', '2233', 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F0e60364e-9df5-45e1-b0f9-0e2b0caa7cf1?alt=media&token=40536f95-9338-4848-a26b-847ba7527b72', 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (25, 'test6@test.com', 'Emir', 'Kapic', '$2a$10$29/.ymCi6SiVB7KQ/kr1M.xWh5gbNJuG0GyPj7sZxisRSItNs/0Xm', NULL, 'ROLE_USER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (31, 'imenijebitno123@outlook.com', NULL, NULL, NULL, NULL, 'ROLE_USER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'oauth', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (30, 'emirkapic0@gmail.com', 'Emir', 'Kapic', NULL, '+123', 'ROLE_USER', NULL, NULL, NULL, NULL, NULL, '2002-03-04 17:00:00+01', NULL, NULL, 'oauth', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (35, 'delete2@test.com', 'Emir', 'Kapic', '$2a$10$xSEHCfLyO0FYDtwyLy15GeehyGFw5wXqSf61Pv1YuMPd70kCJvzNy', NULL, 'ROLE_USER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (10, 'ekapic1144@etf.unsa.ba', 'test', NULL, '$2a$10$fpn3CjZVFO1Nm7GNOf68M.K09XK7rsxsLCjxEVGaDJcXdFoeoTmjK', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (11, 'newmail@etf.unsa.ba', NULL, NULL, '$2a$10$2v0eH.2UJ8iICW8xhBfHYOj/ja/L78t6LoqtwkSHLKnpdUKFpvBZe', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (12, 'newmail23@etf.unsa.ba', NULL, NULL, '$2a$10$fuGlS8U7qDxwhe7XlkJbG.qZAjll9X3xnAoda7uTIxhp2YAZm2/ZC', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (13, 'test1@test.ba', NULL, NULL, '$2a$10$0NqU2Fxp4FeE.ymRCkcGKuJmpssjWQVHRKj1c21NtdedVa0HCmjry', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (14, 'test2@test.ba', 'Emir', 'sadas', '$2a$10$6EdaomTH4pCW7aQl3NlrNOImQnVyAPqH2DePyruGy2jInYp3fb712', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (16, 'sda@dsad.co', 'emir', 'kapic', '$2a$10$N1ZZkjKpbbpfCMNRGMLZQejsJczrIbbspIzuhseuksDqsXTZ9cooG', NULL, 'ROLE_USER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (17, 'emir1234@emir.ba', 'emir', 'kapic', '$2a$10$1HzRzcjDjgQ2YV4s4VC9v.SFRlktxkP/DVmu/eVXXU6o3.kN3Driq', NULL, 'ROLE_USER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (18, 'ee@ee.com', 'emir', 'kpaic', '$2a$10$.tjJ6nXfc.Oqcd5AqrYB/eaFCxIOwopakjneT4GzfVxzhWaCULqHW', NULL, 'ROLE_USER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (19, 'emir1@emir.ba', 'emir', 'kapic', '$2a$10$ucDIeVxRSQ4Krb0xRWipfuk.fNvoktMjGGGpbkqOflJ1ahkOj0VCu', NULL, 'ROLE_USER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (20, 'fake1@fake.com', 'Emir', 'Kapic', '$2a$10$vIEBPVOXFIdua8jGYiWakucoxhVckRFOF/vkmhMOPc8EsQr9nCqEK', NULL, 'ROLE_USER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (21, 'fake2@fake.com', 'Emir', 'Kapic', '$2a$10$a3FpI91HC.yWp.oV3e8mM.xy8XkFRhaVBFLNFUYY3EksCtI5/vlvK', NULL, 'ROLE_USER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (24, 'test5@test.com', 'Emir', 'Kapic', '$2a$10$6XKb6d7FaHE2qik/DIwFc.L./NWNzcb8VgjGm9TgiIJ19jVzxgsuu', NULL, 'ROLE_USER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);
INSERT INTO auctions.app_user (id, email, first_name, last_name, password, phone_number, role, address, city, country, credit_card_number, zip_code, date_of_birth, credit_card, photo_url, authentication_method, deleted) VALUES (22, 'test3@test.com', 'Emir1234', 'Kapic1', '$2a$10$ZRMADMOX85y9SXlzlub6s.AqMIHwNoGPUNJ85YOT8ol3hhtDXffJm', '+123', 'ROLE_USER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credentials', false);


--
-- TOC entry 3703 (class 0 OID 16550)
-- Dependencies: 228
-- Data for Name: bid; Type: TABLE DATA; Schema: auctions; Owner: postgres
--

INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (63, 49, '2023-12-17 17:46:55.625271', 242, 13, false);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (64, 13, '2023-12-17 18:22:39.470242', 257, 15, false);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (65, 19.5, '2023-12-18 08:37:58.048938', 250, 23, false);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (66, 680, '2023-12-18 12:13:08.409638', 249, 23, false);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (67, 14, '2023-12-23 17:16:51.070148', 255, 15, false);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (68, 15, '2023-12-23 17:17:17.542615', 255, 22, false);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (69, 17, '2023-12-23 17:17:33.159999', 255, 15, false);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (70, 19.5, '2023-12-23 19:41:54.866592', 255, 15, false);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (71, 23, '2023-12-23 19:42:31.241909', 255, 15, false);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (72, 25, '2023-12-23 19:42:33.433569', 255, 15, false);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (74, 20, '2024-01-02 10:31:57.353478', 250, 15, false);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (75, 13, '2024-01-06 17:23:20.647198', 252, 34, true);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (76, 40, '2024-01-06 18:00:38.753603', 253, 35, true);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (78, 51, '2024-01-06 18:07:23.681945', 242, 34, true);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (77, 50, '2024-01-06 18:06:59.589345', 242, 34, true);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (79, 22, '2024-01-06 18:11:29.454648', 257, 34, true);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (80, 13, '2024-01-06 20:12:25.774704', 251, 36, true);
INSERT INTO auctions.bid (id, bid, date_created, product_id, bidder_id, deleted) VALUES (81, 27, '2024-01-06 20:13:01.572588', 255, 36, true);


--
-- TOC entry 3695 (class 0 OID 16502)
-- Dependencies: 220
-- Data for Name: category; Type: TABLE DATA; Schema: auctions; Owner: postgres
--

INSERT INTO auctions.category (id, name) VALUES (4, 'Shoes');
INSERT INTO auctions.category (id, name) VALUES (6, 'Home');
INSERT INTO auctions.category (id, name) VALUES (7, 'Electronics');
INSERT INTO auctions.category (id, name) VALUES (8, 'Mobile');
INSERT INTO auctions.category (id, name) VALUES (9, 'Computer');
INSERT INTO auctions.category (id, name) VALUES (2, 'Men');
INSERT INTO auctions.category (id, name) VALUES (5, 'Sportsware');
INSERT INTO auctions.category (id, name) VALUES (3, 'Jewelry');
INSERT INTO auctions.category (id, name) VALUES (1, 'Fashion');


--
-- TOC entry 3706 (class 0 OID 16602)
-- Dependencies: 231
-- Data for Name: payment; Type: TABLE DATA; Schema: auctions; Owner: postgres
--

INSERT INTO auctions.payment (id, date_created, bid_id, session_id) VALUES (8, '2023-12-17 19:26:41.364848+01', 64, 'cs_test_a17PKxPYuzIjag1lPkn4gBKzDewrk9gfu520ZCpRb2IJYlWhq7Nj3W752J');
INSERT INTO auctions.payment (id, date_created, bid_id, session_id) VALUES (9, '2023-12-18 13:14:18.240682+01', 65, 'cs_test_a1DyCtYsSn1cXepEW84sgmYdceIX01zUhmWS629ieZYomqoqvoHVz5F2Wq');


--
-- TOC entry 3697 (class 0 OID 16509)
-- Dependencies: 222
-- Data for Name: product; Type: TABLE DATA; Schema: auctions; Owner: postgres
--

INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (243, '2023-12-17 17:51:55.252633', '2024-01-26 00:00:00', '2023-12-17 17:51:35.63', NULL, 0, 76, 22, 13, 'dress', 'Costarellos Black & White Dress', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (247, '2023-12-17 18:04:43.227402', '2024-01-26 00:00:00', '2023-12-17 18:04:28.714', NULL, 0, 420, 21, 14, 'bag', 'Demelier Vancouver Bag', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (254, '2023-12-17 18:18:25.832771', '2024-01-26 00:00:00', '2023-12-17 18:18:16.698', NULL, 0, 39.95, 24, 23, 'toothbrush', 'Aquasonic Black Series Toothbrush', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (256, '2023-12-17 18:21:19.424897', '2024-01-26 00:00:00', '2023-12-17 18:21:12.116', NULL, 0, 9.95, 24, 23, 'beard roller', 'ROSELYNBOUTIQUE Derma Roller for Beard', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (249, '2023-12-17 18:08:40.315895', '2024-01-26 00:00:00', '2023-12-17 18:08:29.612', 680, 1, 678, 21, 14, 'bag', 'Jacquemus Le Bisou Perle Bag', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (239, '2023-12-17 13:04:16.078529', '2024-01-26 00:00:00', '2023-12-17 13:04:02.933', NULL, 0, 80, 20, 15, 'glasses', 'Gucci Glasses', 'adr', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (275, '2024-01-03 14:06:10.512594', '2025-12-10 13:00:00', '2025-12-07 13:00:00', NULL, 0, 12.53, 22, 30, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (276, '2024-01-03 14:06:10.597047', '2025-12-10 13:00:00', '2025-12-07 13:00:00', NULL, 0, 12.53, 22, 30, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (283, '2024-01-06 21:04:56.992828', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (284, '2024-01-06 21:04:57.003841', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (305, '2024-01-06 21:28:19.403303', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (306, '2024-01-06 21:28:19.41179', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (244, '2023-12-17 17:54:35.145296', '2024-01-26 00:00:00', '2023-12-17 17:54:18.42', NULL, 0, 540, 22, 13, 'dress', 'Louis Vuitton Black Knit Dress', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (248, '2023-12-17 18:06:50.076386', '2024-01-26 00:00:00', '2023-12-17 18:06:42.303', NULL, 0, 268, 21, 14, 'bag', 'Knate Color-Blocked Satchel', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (240, '2023-12-17 17:28:44.833758', '2024-01-26 00:00:00', '2023-12-17 17:27:52.497', NULL, 0, 24, 20, 15, 'glasses', 'Moonbiffy Glasses', '123', 'Sarajevo', 'Croatia', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (277, '2024-01-05 15:38:51.443449', '2025-12-10 14:00:00', '2025-12-07 14:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (278, '2024-01-05 15:38:51.509737', '2025-12-10 14:00:00', '2025-12-07 14:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (257, '2023-12-17 18:22:12.809392', '2024-01-26 00:00:00', '2023-12-17 18:22:00.099', 13, 1, 12, 20, 23, '123', 'testprod', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (255, '2023-12-17 18:19:59.266417', '2024-01-26 00:00:00', '2023-12-17 18:19:50.391', 25, 7, 12.99, 24, 23, 'wash', 'Skin Elements Intimate Wash for Men', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (287, '2024-01-06 21:18:20.889688', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (288, '2024-01-06 21:18:20.8977', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (295, '2024-01-06 21:24:54.00453', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (296, '2024-01-06 21:24:54.013553', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (307, '2024-01-06 21:29:51.352977', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (308, '2024-01-06 21:29:51.362325', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (245, '2023-12-17 17:58:27.142151', '2024-01-26 00:00:00', '2023-12-17 17:00:00', NULL, 0, 350, 22, 13, 'dress', 'Balenciaga Black & White Dress', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (241, '2023-12-17 17:30:38.256772', '2024-01-26 00:00:00', '2023-12-17 17:00:00', NULL, 0, 18, 20, 15, 'glasses', 'Shein Rimless Glasses', '123', 'Sarajevo', 'Croatia', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (260, '2023-12-18 12:16:03.935483', '2024-01-26 00:00:00', '2023-12-18 12:15:43.899', NULL, 0, 25, 22, 23, 'shoes', 'shoes', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (250, '2023-12-17 18:12:12.210582', '2024-01-02 16:35:10.070962', '2023-12-17 18:00:00', 20, 2, 18.5, 23, 22, 'shirt', 'Alimens & Gentle Men''s Button Down Shirt', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (252, '2023-12-17 18:15:04.305628', '2024-01-26 00:00:00', '2023-12-17 18:14:44.455', NULL, 0, 11.99, 23, 22, 'shirt', 'Gildan Adult Ultra Cotton T-shirt', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (251, '2023-12-17 18:13:47.582207', '2024-01-26 00:00:00', '2023-12-17 18:13:37.942', NULL, 1, 12.3, 23, 22, 'shirt', 'Hanes Men''s Shirt', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (279, '2024-01-06 21:01:54.647613', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (280, '2024-01-06 21:01:54.70661', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (285, '2024-01-06 21:12:12.637355', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (286, '2024-01-06 21:12:12.646527', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (289, '2024-01-06 21:21:29.379221', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (290, '2024-01-06 21:21:29.388962', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (297, '2024-01-06 21:26:02.085855', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (298, '2024-01-06 21:26:02.094024', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (299, '2024-01-06 21:26:13.517777', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (300, '2024-01-06 21:26:13.523748', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (311, '2024-01-06 21:30:44.481543', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (312, '2024-01-06 21:30:44.488242', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (246, '2023-12-17 18:02:48.089366', '2024-01-26 00:00:00', '2023-12-17 18:02:28.544', NULL, 0, 60, 21, 14, 'bag', 'Tom Tailor Shopper Bag', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (238, '2023-12-17 13:00:53.501789', '2024-01-26 00:00:00', '2023-12-17 13:00:29.404', NULL, 0, 20, 20, 15, 'glasses', 'Marks & Spencer Aviator Glasses', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (261, '2023-12-19 12:15:51.041908', '2024-01-26 00:00:00', '2023-12-19 12:15:31.145', NULL, 0, 22, 21, 23, '1234', 'testitem', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (273, '2024-01-02 16:54:53.546974', '2025-12-10 15:00:00', '2025-12-07 15:00:00', NULL, 0, 12.53, 22, 15, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (274, '2024-01-02 16:54:53.578386', '2025-12-10 15:00:00', '2025-12-07 15:00:00', NULL, 0, 12.53, 22, 15, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (253, '2023-12-17 18:16:18.612639', '2024-01-26 00:00:00', '2023-12-17 18:16:09.749', NULL, 1, 37.98, 23, 22, 'shirt', 'CQR Men''s All Cotton Flannel Shirt', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (242, '2023-12-17 17:34:37.256058', '2024-01-26 00:00:00', '2023-12-17 17:33:30.906', 49, 1, 48, 22, 15, 'clothes', 'Lazada Floral Mock Dress', '123', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (281, '2024-01-06 21:03:56.769718', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (282, '2024-01-06 21:03:56.795129', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (291, '2024-01-06 21:23:10.10006', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (292, '2024-01-06 21:23:10.111739', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (293, '2024-01-06 21:24:02.624613', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (294, '2024-01-06 21:24:02.635954', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (301, '2024-01-06 21:27:06.883832', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (302, '2024-01-06 21:27:06.898457', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (303, '2024-01-06 21:27:16.496077', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (304, '2024-01-06 21:27:16.503538', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (309, '2024-01-06 21:30:27.344167', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);
INSERT INTO auctions.product (id, date_created, date_end, date_start, highest_bid, number_of_bids, start_bid, subcategory_id, seller_id, description, name, address, city, country, email, phone_number, zip_code, purchased) VALUES (310, '2024-01-06 21:30:27.352292', '2025-12-10 20:00:00', '2025-12-07 20:00:00', NULL, 0, 12.53, 22, 23, 'Brand new shoes!', 'Shoes2', 'Zmaja od Bosne BB', 'Sarajevo', 'Bosnia & Herzegovina', NULL, '+123', '71000', false);


--
-- TOC entry 3699 (class 0 OID 16516)
-- Dependencies: 224
-- Data for Name: product_image; Type: TABLE DATA; Schema: auctions; Owner: postgres
--

INSERT INTO auctions.product_image (id, url, product_id) VALUES (248, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2Fae9977c8-3183-406f-bca9-773aaf976a14?alt=media&token=5aaa96fc-5b0c-41ef-b5e7-cbcf96cdf016', 243);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (252, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F60f41604-7564-47bb-bcd6-5912f855e15d?alt=media&token=68e3145d-0a03-4536-a25d-08f45ffc28ae', 247);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (254, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F13b6627a-1213-4ebb-bf2b-23635727c617?alt=media&token=a2edf1a9-1258-4385-a8fe-cb6018fe0aca', 249);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (259, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2Fa50079e8-29e9-4273-bbd7-a4528da82e45?alt=media&token=65d6aad4-8be2-46c8-a8a2-ac6a7b4ade3c', 254);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (261, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2Fd7b59d34-cde2-4414-8b02-1b32be42a324?alt=media&token=0266bc19-ca55-4adf-915a-5ff3735dd9e7', 256);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (326, 'http://linktomyimage.com', 279);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (327, 'http://linktomyimage2.com', 279);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (328, 'http://linktomyimage.com', 279);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (329, 'http://linktomyimage.com', 280);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (330, 'http://linktomyimage2.com', 280);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (331, 'http://linktomyimage.com', 280);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (344, 'http://linktomyimage.com', 285);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (345, 'http://linktomyimage2.com', 285);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (346, 'http://linktomyimage.com', 285);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (347, 'http://linktomyimage.com', 286);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (348, 'http://linktomyimage2.com', 286);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (349, 'http://linktomyimage.com', 286);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (356, 'http://linktomyimage.com', 289);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (357, 'http://linktomyimage2.com', 289);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (358, 'http://linktomyimage.com', 289);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (359, 'http://linktomyimage.com', 290);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (360, 'http://linktomyimage2.com', 290);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (361, 'http://linktomyimage.com', 290);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (380, 'http://linktomyimage.com', 297);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (381, 'http://linktomyimage2.com', 297);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (382, 'http://linktomyimage.com', 297);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (383, 'http://linktomyimage.com', 298);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (384, 'http://linktomyimage2.com', 298);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (385, 'http://linktomyimage.com', 298);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (386, 'http://linktomyimage.com', 299);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (387, 'http://linktomyimage2.com', 299);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (388, 'http://linktomyimage.com', 299);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (389, 'http://linktomyimage.com', 300);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (390, 'http://linktomyimage2.com', 300);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (391, 'http://linktomyimage.com', 300);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (249, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F9f1ce3b0-426c-4d47-a4fe-6f65a6a39aa2?alt=media&token=765bf0c2-3c92-4f1f-b508-80d3c6f1be32', 244);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (253, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F41968b67-dd29-4d3d-ad40-7003c3028bb8?alt=media&token=08c1c91a-7493-4b19-9e51-7ee1d59269ad', 248);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (260, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2Fcaf31e65-7ed0-4367-b651-61e0bfb8a046?alt=media&token=7b4fc0fd-aa71-4a7e-b16b-c7db352c5917', 255);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (262, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F048429f5-c626-4289-a8be-233ab7e69c6c?alt=media&token=b295caea-a4fb-4398-90ce-884e435e6580', 257);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (308, 'http://linktomyimage.com', 273);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (309, 'http://linktomyimage2.com', 273);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (310, 'http://linktomyimage.com', 273);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (311, 'http://linktomyimage.com', 274);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (312, 'http://linktomyimage2.com', 274);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (313, 'http://linktomyimage.com', 274);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (332, 'http://linktomyimage.com', 281);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (333, 'http://linktomyimage2.com', 281);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (334, 'http://linktomyimage.com', 281);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (335, 'http://linktomyimage.com', 282);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (336, 'http://linktomyimage2.com', 282);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (337, 'http://linktomyimage.com', 282);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (362, 'http://linktomyimage.com', 291);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (363, 'http://linktomyimage2.com', 291);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (364, 'http://linktomyimage.com', 291);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (365, 'http://linktomyimage.com', 292);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (366, 'http://linktomyimage2.com', 292);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (367, 'http://linktomyimage.com', 292);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (368, 'http://linktomyimage.com', 293);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (369, 'http://linktomyimage2.com', 293);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (370, 'http://linktomyimage.com', 293);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (371, 'http://linktomyimage.com', 294);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (372, 'http://linktomyimage2.com', 294);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (373, 'http://linktomyimage.com', 294);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (392, 'http://linktomyimage.com', 301);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (393, 'http://linktomyimage2.com', 301);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (394, 'http://linktomyimage.com', 301);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (395, 'http://linktomyimage.com', 302);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (396, 'http://linktomyimage2.com', 302);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (397, 'http://linktomyimage.com', 302);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (398, 'http://linktomyimage.com', 303);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (399, 'http://linktomyimage2.com', 303);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (400, 'http://linktomyimage.com', 303);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (401, 'http://linktomyimage.com', 304);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (402, 'http://linktomyimage2.com', 304);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (403, 'http://linktomyimage.com', 304);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (416, 'http://linktomyimage.com', 309);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (417, 'http://linktomyimage2.com', 309);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (418, 'http://linktomyimage.com', 309);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (419, 'http://linktomyimage.com', 310);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (420, 'http://linktomyimage2.com', 310);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (421, 'http://linktomyimage.com', 310);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (250, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2Fb4c5413a-243b-44f9-88ec-2587944d64db?alt=media&token=7bd411f8-4d59-4736-958d-28668c088ce9', 245);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (255, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F64aafd19-bbda-41b7-a9a0-16e7e780b182?alt=media&token=072d9973-6783-40d1-a710-69c300b65595', 250);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (256, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F8504adf2-fc65-4d7a-ac70-7b0eeb86674f?alt=media&token=a1dae95f-b158-428d-8594-7a346fd3eade', 251);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (257, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2Fb66a1c7c-0e13-4b3e-8149-e61cbce5785a?alt=media&token=c1612963-2c10-40a7-a5df-e2effe2835ed', 252);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (269, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2Fea580fe0-a63e-4066-97a2-241575a3456f?alt=media&token=dfe90990-aa12-4262-a4e3-89ac85f1065d', 260);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (270, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F6faee11f-36e8-4ff0-954f-d0f6d170101e?alt=media&token=14bc01c1-6d21-45fa-8b9e-b62ba97853fc', 260);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (271, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F71ee8cf3-2074-4ad1-a6be-7099346cdfe9?alt=media&token=8bf6d67b-edf7-4dc9-b2d4-91ac6c747409', 260);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (314, 'http://linktomyimage.com', 275);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (315, 'http://linktomyimage2.com', 275);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (316, 'http://linktomyimage.com', 275);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (317, 'http://linktomyimage.com', 276);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (318, 'http://linktomyimage2.com', 276);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (319, 'http://linktomyimage.com', 276);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (338, 'http://linktomyimage.com', 283);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (339, 'http://linktomyimage2.com', 283);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (340, 'http://linktomyimage.com', 283);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (341, 'http://linktomyimage.com', 284);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (342, 'http://linktomyimage2.com', 284);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (343, 'http://linktomyimage.com', 284);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (404, 'http://linktomyimage.com', 305);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (405, 'http://linktomyimage2.com', 305);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (406, 'http://linktomyimage.com', 305);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (407, 'http://linktomyimage.com', 306);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (408, 'http://linktomyimage2.com', 306);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (409, 'http://linktomyimage.com', 306);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (251, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F91aee26a-9433-4581-a33a-7451416fa0b6?alt=media&token=94335451-b946-4a69-98b7-7181e033f98b', 246);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (258, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2Fdc770ab5-5f15-4689-960e-a9929761ac8e?alt=media&token=60d90b74-be4c-40ae-81ec-5bc6e347edf6', 253);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (272, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F8127e859-e802-45d8-b4e0-05db42bb5414?alt=media&token=bcf80a8a-c7c2-453a-b4b9-1a1c235074ca', 261);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (273, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F3b2005b9-55d4-4e21-b9f3-f75a00117fb2?alt=media&token=c57e2d76-9db1-41a4-b3e0-80e21b20ab2c', 261);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (274, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F267f9e0d-b817-41b5-afb4-35430b1aa9ce?alt=media&token=90f3207b-10f1-462c-9c9d-f6906e9e95ab', 261);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (320, 'http://linktomyimage.com', 277);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (321, 'http://linktomyimage2.com', 277);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (322, 'http://linktomyimage.com', 277);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (323, 'http://linktomyimage.com', 278);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (324, 'http://linktomyimage2.com', 278);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (325, 'http://linktomyimage.com', 278);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (350, 'http://linktomyimage.com', 287);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (351, 'http://linktomyimage2.com', 287);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (352, 'http://linktomyimage.com', 287);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (353, 'http://linktomyimage.com', 288);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (354, 'http://linktomyimage2.com', 288);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (355, 'http://linktomyimage.com', 288);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (374, 'http://linktomyimage.com', 295);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (243, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F4a6ec298-d768-4c6a-b6fa-ab56c8d86bbd?alt=media&token=7bf8b9cf-ed5e-415b-8d18-a954ff9aa3fb', 238);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (244, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F5516487a-08e0-4cf0-abb1-4ec3bf03ff3f?alt=media&token=0c33908d-a2cd-410f-8f47-ce96516b4cf0', 239);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (245, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F48f005ac-48a9-480b-9632-d17e6a06ca3d?alt=media&token=c66359d9-4e44-4e13-807c-bbe5fb1f49b8', 240);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (246, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2Fde8d41e4-e8dc-4b4a-b938-60dbee9c100b?alt=media&token=31df8c1d-b7e7-4c54-a6e2-e79b2d306342', 241);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (247, 'https://firebasestorage.googleapis.com/v0/b/auctionapp-6f67d.appspot.com/o/blob%3Ahttp%3A%2Flocalhost%3A5173%2F697b2962-4ef5-4904-8c91-365afce2a0b3?alt=media&token=a2776f71-60a7-4647-a493-edd398ece00e', 242);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (375, 'http://linktomyimage2.com', 295);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (376, 'http://linktomyimage.com', 295);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (377, 'http://linktomyimage.com', 296);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (378, 'http://linktomyimage2.com', 296);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (379, 'http://linktomyimage.com', 296);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (410, 'http://linktomyimage.com', 307);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (411, 'http://linktomyimage2.com', 307);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (412, 'http://linktomyimage.com', 307);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (413, 'http://linktomyimage.com', 308);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (414, 'http://linktomyimage2.com', 308);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (415, 'http://linktomyimage.com', 308);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (422, 'http://linktomyimage.com', 311);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (423, 'http://linktomyimage2.com', 311);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (424, 'http://linktomyimage.com', 311);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (425, 'http://linktomyimage.com', 312);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (426, 'http://linktomyimage2.com', 312);
INSERT INTO auctions.product_image (id, url, product_id) VALUES (427, 'http://linktomyimage.com', 312);


--
-- TOC entry 3701 (class 0 OID 16523)
-- Dependencies: 226
-- Data for Name: sub_category; Type: TABLE DATA; Schema: auctions; Owner: postgres
--

INSERT INTO auctions.sub_category (id, name, category_id, product_count) VALUES (22, 'Clothes', 1, 6);
INSERT INTO auctions.sub_category (id, name, category_id, product_count) VALUES (20, 'Accessories', 1, 8);
INSERT INTO auctions.sub_category (id, name, category_id, product_count) VALUES (23, 'Shirts', 2, 3);
INSERT INTO auctions.sub_category (id, name, category_id, product_count) VALUES (24, 'Hygiene', 2, 3);
INSERT INTO auctions.sub_category (id, name, category_id, product_count) VALUES (21, 'Bags', 1, 6);


--
-- TOC entry 3708 (class 0 OID 16617)
-- Dependencies: 233
-- Data for Name: user_seller_interaction; Type: TABLE DATA; Schema: auctions; Owner: postgres
--

INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (30, 6, '2024-01-02 11:31:53.216441+01', 6, 22, 15);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (34, 3, '2024-01-06 19:00:28.842415+01', 3, 22, 35);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (28, 1, '2023-12-28 11:09:11.943622+01', 1, 15, 23);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (20, 4, '2023-12-28 11:09:38.307904+01', 14, 14, 23);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (22, 4, '2023-12-23 17:14:54.88835+01', 4, 13, 23);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (36, 6, '2024-01-06 19:06:45.710575+01', 6, 15, 34);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (32, 0, '2024-01-06 19:11:04.719201+01', 10, 22, 34);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (38, 5, '2024-01-06 19:11:22.958136+01', 5, 23, 34);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (15, 9, '2023-12-17 18:42:04.118133+01', 9, 15, 13);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (44, 2, '2024-01-06 21:12:40.232031+01', 2, 13, 36);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (45, 1, '2024-01-06 21:12:48.170527+01', 1, 14, 36);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (40, 7, '2024-01-06 21:12:13.764486+01', 7, 22, 36);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (37, 1, '2024-01-06 19:11:02.06418+01', 1, 13, 34);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (25, 3, '2023-12-26 12:37:37.492554+01', 3, 22, 24);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (42, 6, '2024-01-06 21:12:37.410268+01', 6, 23, 36);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (18, 2, '2024-01-02 11:32:08.508104+01', 62, 22, 23);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (23, 8, '2023-12-23 18:17:11.087419+01', 8, 23, 22);
INSERT INTO auctions.user_seller_interaction (id, interacted_with_counter, last_interacted_with, views, seller_id, user_id) VALUES (16, 0, '2023-12-23 20:42:33.45394+01', 30, 23, 15);


--
-- TOC entry 3710 (class 0 OID 16624)
-- Dependencies: 235
-- Data for Name: user_subcategory_interaction; Type: TABLE DATA; Schema: auctions; Owner: postgres
--

INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (23, 1, '2024-01-02 11:32:08.521171+01', 61, 23, 23);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (20, 5, '2023-12-17 18:46:38.667778+01', 5, 22, 13);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (30, 8, '2023-12-23 18:17:11.085434+01', 8, 24, 22);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (18, 4, '2023-12-17 18:42:04.116095+01', 4, 20, 13);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (36, 6, '2024-01-02 11:31:53.230607+01', 6, 23, 15);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (32, 3, '2023-12-26 12:37:37.488475+01', 3, 23, 24);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (22, 3, '2023-12-17 19:26:53.469883+01', 13, 20, 15);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (40, 3, '2024-01-06 19:00:28.840236+01', 3, 23, 35);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (41, 7, '2024-01-06 19:06:45.709514+01', 7, 22, 34);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (37, 1, '2024-01-06 19:11:04.711606+01', 11, 23, 34);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (42, 4, '2024-01-06 19:11:22.957289+01', 4, 20, 34);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (25, 5, '2023-12-28 11:09:38.283238+01', 15, 21, 23);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (27, 5, '2023-12-23 17:14:54.886017+01', 5, 22, 23);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (29, 8, '2023-12-23 20:41:49.036458+01', 18, 24, 15);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (48, 2, '2024-01-06 21:12:40.231318+01', 2, 22, 36);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (49, 1, '2024-01-06 21:12:48.169215+01', 1, 21, 36);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (46, 6, '2024-01-06 21:12:37.408201+01', 6, 24, 36);
INSERT INTO auctions.user_subcategory_interaction (id, interacted_with_counter, last_interacted_with, views, subcategory_id, user_id) VALUES (44, 7, '2024-01-06 21:12:13.762182+01', 7, 23, 36);


--
-- TOC entry 3704 (class 0 OID 16566)
-- Dependencies: 229
-- Data for Name: wishlist; Type: TABLE DATA; Schema: auctions; Owner: postgres
--



--
-- TOC entry 3726 (class 0 OID 0)
-- Dependencies: 217
-- Name: app_user_id_seq; Type: SEQUENCE SET; Schema: auctions; Owner: postgres
--

SELECT pg_catalog.setval('auctions.app_user_id_seq', 36, true);


--
-- TOC entry 3727 (class 0 OID 0)
-- Dependencies: 227
-- Name: bid_id_seq; Type: SEQUENCE SET; Schema: auctions; Owner: postgres
--

SELECT pg_catalog.setval('auctions.bid_id_seq', 81, true);


--
-- TOC entry 3728 (class 0 OID 0)
-- Dependencies: 219
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: auctions; Owner: postgres
--

SELECT pg_catalog.setval('auctions.category_id_seq', 9, true);


--
-- TOC entry 3729 (class 0 OID 0)
-- Dependencies: 230
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: auctions; Owner: postgres
--

SELECT pg_catalog.setval('auctions.payment_id_seq', 9, true);


--
-- TOC entry 3730 (class 0 OID 0)
-- Dependencies: 221
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: auctions; Owner: postgres
--

SELECT pg_catalog.setval('auctions.product_id_seq', 312, true);


--
-- TOC entry 3731 (class 0 OID 0)
-- Dependencies: 223
-- Name: product_image_id_seq; Type: SEQUENCE SET; Schema: auctions; Owner: postgres
--

SELECT pg_catalog.setval('auctions.product_image_id_seq', 427, true);


--
-- TOC entry 3732 (class 0 OID 0)
-- Dependencies: 225
-- Name: sub_category_id_seq; Type: SEQUENCE SET; Schema: auctions; Owner: postgres
--

SELECT pg_catalog.setval('auctions.sub_category_id_seq', 24, true);


--
-- TOC entry 3733 (class 0 OID 0)
-- Dependencies: 232
-- Name: user_seller_interaction_id_seq; Type: SEQUENCE SET; Schema: auctions; Owner: postgres
--

SELECT pg_catalog.setval('auctions.user_seller_interaction_id_seq', 46, true);


--
-- TOC entry 3734 (class 0 OID 0)
-- Dependencies: 234
-- Name: user_subcategory_interaction_id_seq; Type: SEQUENCE SET; Schema: auctions; Owner: postgres
--

SELECT pg_catalog.setval('auctions.user_subcategory_interaction_id_seq', 50, true);


--
-- TOC entry 3511 (class 2606 OID 16500)
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3523 (class 2606 OID 16555)
-- Name: bid bid_pkey; Type: CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.bid
    ADD CONSTRAINT bid_pkey PRIMARY KEY (id);


--
-- TOC entry 3515 (class 2606 OID 16507)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3525 (class 2606 OID 16607)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- TOC entry 3519 (class 2606 OID 16521)
-- Name: product_image product_image_pkey; Type: CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.product_image
    ADD CONSTRAINT product_image_pkey PRIMARY KEY (id);


--
-- TOC entry 3517 (class 2606 OID 16514)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3521 (class 2606 OID 16528)
-- Name: sub_category sub_category_pkey; Type: CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.sub_category
    ADD CONSTRAINT sub_category_pkey PRIMARY KEY (id);


--
-- TOC entry 3527 (class 2606 OID 16609)
-- Name: payment uk_9fm5lnl1ax21x9x33ikrjc1v7; Type: CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.payment
    ADD CONSTRAINT uk_9fm5lnl1ax21x9x33ikrjc1v7 UNIQUE (bid_id);


--
-- TOC entry 3513 (class 2606 OID 16595)
-- Name: app_user unique_email; Type: CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.app_user
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- TOC entry 3529 (class 2606 OID 16653)
-- Name: user_seller_interaction uq_useridsellerid; Type: CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.user_seller_interaction
    ADD CONSTRAINT uq_useridsellerid UNIQUE (user_id, seller_id);


--
-- TOC entry 3533 (class 2606 OID 16651)
-- Name: user_subcategory_interaction uq_useridsubcatid; Type: CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.user_subcategory_interaction
    ADD CONSTRAINT uq_useridsubcatid UNIQUE (user_id, subcategory_id);


--
-- TOC entry 3531 (class 2606 OID 16622)
-- Name: user_seller_interaction user_seller_interaction_pkey; Type: CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.user_seller_interaction
    ADD CONSTRAINT user_seller_interaction_pkey PRIMARY KEY (id);


--
-- TOC entry 3535 (class 2606 OID 16629)
-- Name: user_subcategory_interaction user_subcategory_interaction_pkey; Type: CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.user_subcategory_interaction
    ADD CONSTRAINT user_subcategory_interaction_pkey PRIMARY KEY (id);


--
-- TOC entry 3540 (class 2606 OID 16596)
-- Name: bid fk5roa0kvhmpglm1vr3r3xsuq9h; Type: FK CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.bid
    ADD CONSTRAINT fk5roa0kvhmpglm1vr3r3xsuq9h FOREIGN KEY (bidder_id) REFERENCES auctions.app_user(id);


--
-- TOC entry 3538 (class 2606 OID 16539)
-- Name: product_image fk6oo0cvcdtb6qmwsga468uuukk; Type: FK CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.product_image
    ADD CONSTRAINT fk6oo0cvcdtb6qmwsga468uuukk FOREIGN KEY (product_id) REFERENCES auctions.product(id);


--
-- TOC entry 3541 (class 2606 OID 16556)
-- Name: bid fkbsfo13efitjd418x6wf90b0ya; Type: FK CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.bid
    ADD CONSTRAINT fkbsfo13efitjd418x6wf90b0ya FOREIGN KEY (product_id) REFERENCES auctions.product(id);


--
-- TOC entry 3545 (class 2606 OID 16635)
-- Name: user_seller_interaction fkc2cdcdffc899b5evvk5en8gsb; Type: FK CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.user_seller_interaction
    ADD CONSTRAINT fkc2cdcdffc899b5evvk5en8gsb FOREIGN KEY (user_id) REFERENCES auctions.app_user(id);


--
-- TOC entry 3547 (class 2606 OID 16645)
-- Name: user_subcategory_interaction fkf5is1ntuduyin3tubw7e23mc0; Type: FK CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.user_subcategory_interaction
    ADD CONSTRAINT fkf5is1ntuduyin3tubw7e23mc0 FOREIGN KEY (user_id) REFERENCES auctions.app_user(id);


--
-- TOC entry 3539 (class 2606 OID 16544)
-- Name: sub_category fkl65dyy5me2ypoyj8ou1hnt64e; Type: FK CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.sub_category
    ADD CONSTRAINT fkl65dyy5me2ypoyj8ou1hnt64e FOREIGN KEY (category_id) REFERENCES auctions.category(id);


--
-- TOC entry 3542 (class 2606 OID 16574)
-- Name: wishlist fklels30avfw014lijc4nfqxkvp; Type: FK CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.wishlist
    ADD CONSTRAINT fklels30avfw014lijc4nfqxkvp FOREIGN KEY (user_id) REFERENCES auctions.app_user(id);


--
-- TOC entry 3536 (class 2606 OID 16529)
-- Name: product fkniucpti15id7jc1gqsnlcpd0b; Type: FK CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.product
    ADD CONSTRAINT fkniucpti15id7jc1gqsnlcpd0b FOREIGN KEY (subcategory_id) REFERENCES auctions.sub_category(id);


--
-- TOC entry 3548 (class 2606 OID 16640)
-- Name: user_subcategory_interaction fko3rgyp7cp79pyv89ws5lit950; Type: FK CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.user_subcategory_interaction
    ADD CONSTRAINT fko3rgyp7cp79pyv89ws5lit950 FOREIGN KEY (subcategory_id) REFERENCES auctions.sub_category(id);


--
-- TOC entry 3546 (class 2606 OID 16630)
-- Name: user_seller_interaction fkolsysa9n8xi107vtbl62myla6; Type: FK CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.user_seller_interaction
    ADD CONSTRAINT fkolsysa9n8xi107vtbl62myla6 FOREIGN KEY (seller_id) REFERENCES auctions.app_user(id);


--
-- TOC entry 3543 (class 2606 OID 16569)
-- Name: wishlist fkqchevbfw5wq0f4uqacns02rp7; Type: FK CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.wishlist
    ADD CONSTRAINT fkqchevbfw5wq0f4uqacns02rp7 FOREIGN KEY (product_id) REFERENCES auctions.product(id);


--
-- TOC entry 3544 (class 2606 OID 16610)
-- Name: payment fkqtcp2jq02k2e3rqkbdqcttepy; Type: FK CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.payment
    ADD CONSTRAINT fkqtcp2jq02k2e3rqkbdqcttepy FOREIGN KEY (bid_id) REFERENCES auctions.bid(id);


--
-- TOC entry 3537 (class 2606 OID 16534)
-- Name: product fkthco7cl7o18ewrdcav6n9llbe; Type: FK CONSTRAINT; Schema: auctions; Owner: postgres
--

ALTER TABLE ONLY auctions.product
    ADD CONSTRAINT fkthco7cl7o18ewrdcav6n9llbe FOREIGN KEY (seller_id) REFERENCES auctions.app_user(id);


-- Completed on 2024-01-08 22:55:35 CET

--
-- PostgreSQL database dump complete
--

