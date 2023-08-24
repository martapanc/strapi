--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 14.8 (Homebrew)

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

DROP DATABASE IF EXISTS railway;
--
-- Name: railway; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE railway WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE railway OWNER TO postgres;

\connect railway

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_permissions OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_id_seq OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);


ALTER TABLE public.admin_permissions_role_links OWNER TO postgres;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_role_links_id_seq OWNER TO postgres;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNED BY public.admin_permissions_role_links.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_roles OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_roles_id_seq OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users_roles_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_order double precision,
    user_order double precision
);


ALTER TABLE public.admin_users_roles_links OWNER TO postgres;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_roles_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_roles_links_id_seq OWNER TO postgres;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNED BY public.admin_users_roles_links.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title character varying(255),
    author character varying(255),
    goodreads_link character varying(255),
    genre character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    rank integer
);


ALTER TABLE public.books OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: books_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books_localizations_links (
    id integer NOT NULL,
    book_id integer,
    inv_book_id integer,
    book_order double precision
);


ALTER TABLE public.books_localizations_links OWNER TO postgres;

--
-- Name: books_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_localizations_links_id_seq OWNER TO postgres;

--
-- Name: books_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_localizations_links_id_seq OWNED BY public.books_localizations_links.id;


--
-- Name: code_snippets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.code_snippets (
    id integer NOT NULL,
    code text,
    language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.code_snippets OWNER TO postgres;

--
-- Name: code_snippets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.code_snippets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.code_snippets_id_seq OWNER TO postgres;

--
-- Name: code_snippets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.code_snippets_id_seq OWNED BY public.code_snippets.id;


--
-- Name: components_shared_meta_socials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_shared_meta_socials (
    id integer NOT NULL,
    social_network character varying(255),
    title character varying(255),
    description character varying(255)
);


ALTER TABLE public.components_shared_meta_socials OWNER TO postgres;

--
-- Name: components_shared_meta_socials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_shared_meta_socials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_shared_meta_socials_id_seq OWNER TO postgres;

--
-- Name: components_shared_meta_socials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_shared_meta_socials_id_seq OWNED BY public.components_shared_meta_socials.id;


--
-- Name: components_shared_seos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_shared_seos (
    id integer NOT NULL,
    meta_title character varying(255),
    meta_description character varying(255),
    keywords text,
    meta_robots character varying(255),
    structured_data jsonb,
    meta_viewport character varying(255),
    canonical_url character varying(255)
);


ALTER TABLE public.components_shared_seos OWNER TO postgres;

--
-- Name: components_shared_seos_components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_shared_seos_components (
    id integer NOT NULL,
    entity_id integer,
    component_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_shared_seos_components OWNER TO postgres;

--
-- Name: components_shared_seos_components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_shared_seos_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_shared_seos_components_id_seq OWNER TO postgres;

--
-- Name: components_shared_seos_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_shared_seos_components_id_seq OWNED BY public.components_shared_seos_components.id;


--
-- Name: components_shared_seos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_shared_seos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_shared_seos_id_seq OWNER TO postgres;

--
-- Name: components_shared_seos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_shared_seos_id_seq OWNED BY public.components_shared_seos.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: files_folder_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_folder_links (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_order double precision
);


ALTER TABLE public.files_folder_links OWNER TO postgres;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_folder_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_folder_links_id_seq OWNER TO postgres;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_folder_links_id_seq OWNED BY public.files_folder_links.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_related_morphs (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.files_related_morphs OWNER TO postgres;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_related_morphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_related_morphs_id_seq OWNER TO postgres;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_related_morphs_id_seq OWNED BY public.files_related_morphs.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.i18n_locale OWNER TO postgres;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.i18n_locale_id_seq OWNER TO postgres;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: iconlibrary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iconlibrary (
    id integer NOT NULL,
    name character varying(255),
    abbreviation character varying(255),
    is_enabled boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.iconlibrary OWNER TO postgres;

--
-- Name: iconlibrary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.iconlibrary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iconlibrary_id_seq OWNER TO postgres;

--
-- Name: iconlibrary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.iconlibrary_id_seq OWNED BY public.iconlibrary.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id integer NOT NULL,
    description text,
    title character varying(255),
    company_name character varying(255),
    location character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    start_date date,
    end_date date,
    is_current_job boolean,
    main_color character varying(255),
    dark_color character varying(255),
    technologies jsonb
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: jobs_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs_localizations_links (
    id integer NOT NULL,
    job_id integer,
    inv_job_id integer,
    job_order double precision
);


ALTER TABLE public.jobs_localizations_links OWNER TO postgres;

--
-- Name: jobs_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_localizations_links_id_seq OWNER TO postgres;

--
-- Name: jobs_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_localizations_links_id_seq OWNED BY public.jobs_localizations_links.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id integer NOT NULL,
    name character varying(255),
    level character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    rank integer
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: languages_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages_localizations_links (
    id integer NOT NULL,
    language_id integer,
    inv_language_id integer,
    language_order double precision
);


ALTER TABLE public.languages_localizations_links OWNER TO postgres;

--
-- Name: languages_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languages_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_localizations_links_id_seq OWNER TO postgres;

--
-- Name: languages_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languages_localizations_links_id_seq OWNED BY public.languages_localizations_links.id;


--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_items (
    id integer NOT NULL,
    "order" integer,
    title character varying(255),
    url character varying(255),
    target character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.menu_items OWNER TO postgres;

--
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_items_id_seq OWNER TO postgres;

--
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_items_id_seq OWNED BY public.menu_items.id;


--
-- Name: menu_items_parent_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_items_parent_links (
    id integer NOT NULL,
    menu_item_id integer,
    inv_menu_item_id integer
);


ALTER TABLE public.menu_items_parent_links OWNER TO postgres;

--
-- Name: menu_items_parent_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_items_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_items_parent_links_id_seq OWNER TO postgres;

--
-- Name: menu_items_parent_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_items_parent_links_id_seq OWNED BY public.menu_items_parent_links.id;


--
-- Name: menu_items_root_menu_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_items_root_menu_links (
    id integer NOT NULL,
    menu_item_id integer,
    menu_id integer,
    menu_item_order double precision
);


ALTER TABLE public.menu_items_root_menu_links OWNER TO postgres;

--
-- Name: menu_items_root_menu_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_items_root_menu_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_items_root_menu_links_id_seq OWNER TO postgres;

--
-- Name: menu_items_root_menu_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_items_root_menu_links_id_seq OWNED BY public.menu_items_root_menu_links.id;


--
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus (
    id integer NOT NULL,
    title character varying(255),
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.menus OWNER TO postgres;

--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_id_seq OWNER TO postgres;

--
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;


--
-- Name: podcasts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.podcasts (
    id integer NOT NULL,
    name character varying(255),
    author character varying(255),
    language character varying(255),
    media_link character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.podcasts OWNER TO postgres;

--
-- Name: podcasts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.podcasts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.podcasts_id_seq OWNER TO postgres;

--
-- Name: podcasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.podcasts_id_seq OWNED BY public.podcasts.id;


--
-- Name: publications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publications (
    id integer NOT NULL,
    title character varying(255),
    description character varying(255),
    publisher character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    year character varying(255),
    rank integer
);


ALTER TABLE public.publications OWNER TO postgres;

--
-- Name: publications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.publications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_id_seq OWNER TO postgres;

--
-- Name: publications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.publications_id_seq OWNED BY public.publications.id;


--
-- Name: publications_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publications_localizations_links (
    id integer NOT NULL,
    publication_id integer,
    inv_publication_id integer,
    publication_order double precision
);


ALTER TABLE public.publications_localizations_links OWNER TO postgres;

--
-- Name: publications_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.publications_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_localizations_links_id_seq OWNER TO postgres;

--
-- Name: publications_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.publications_localizations_links_id_seq OWNED BY public.publications_localizations_links.id;


--
-- Name: random_facts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.random_facts (
    id integer NOT NULL,
    name character varying(255),
    headline text,
    description text,
    is_fact_true boolean,
    explanation text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.random_facts OWNER TO postgres;

--
-- Name: random_facts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.random_facts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.random_facts_id_seq OWNER TO postgres;

--
-- Name: random_facts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.random_facts_id_seq OWNED BY public.random_facts.id;


--
-- Name: random_facts_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.random_facts_localizations_links (
    id integer NOT NULL,
    random_fact_id integer,
    inv_random_fact_id integer,
    random_fact_order double precision
);


ALTER TABLE public.random_facts_localizations_links OWNER TO postgres;

--
-- Name: random_facts_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.random_facts_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.random_facts_localizations_links_id_seq OWNER TO postgres;

--
-- Name: random_facts_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.random_facts_localizations_links_id_seq OWNED BY public.random_facts_localizations_links.id;


--
-- Name: schools; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schools (
    id integer NOT NULL,
    school_name character varying(255),
    degree_name character varying(255),
    degree_url character varying(255),
    grade character varying(255),
    start date,
    "end" date,
    description text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.schools OWNER TO postgres;

--
-- Name: schools_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schools_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schools_id_seq OWNER TO postgres;

--
-- Name: schools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schools_id_seq OWNED BY public.schools.id;


--
-- Name: schools_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schools_localizations_links (
    id integer NOT NULL,
    school_id integer,
    inv_school_id integer,
    school_order double precision
);


ALTER TABLE public.schools_localizations_links OWNER TO postgres;

--
-- Name: schools_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schools_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schools_localizations_links_id_seq OWNER TO postgres;

--
-- Name: schools_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schools_localizations_links_id_seq OWNED BY public.schools_localizations_links.id;


--
-- Name: skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skills (
    id integer NOT NULL,
    title character varying(255),
    description text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    rank integer
);


ALTER TABLE public.skills OWNER TO postgres;

--
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skills_id_seq OWNER TO postgres;

--
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skills_id_seq OWNED BY public.skills.id;


--
-- Name: skills_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skills_localizations_links (
    id integer NOT NULL,
    skill_id integer,
    inv_skill_id integer,
    skill_order double precision
);


ALTER TABLE public.skills_localizations_links OWNER TO postgres;

--
-- Name: skills_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skills_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skills_localizations_links_id_seq OWNER TO postgres;

--
-- Name: skills_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skills_localizations_links_id_seq OWNED BY public.skills_localizations_links.id;


--
-- Name: software_development_intros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.software_development_intros (
    id integer NOT NULL,
    title character varying(255),
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    vuid character varying(255),
    version_number integer,
    version_comment character varying(255),
    is_visible_in_list_view boolean,
    locale character varying(255)
);


ALTER TABLE public.software_development_intros OWNER TO postgres;

--
-- Name: software_development_intros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.software_development_intros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.software_development_intros_id_seq OWNER TO postgres;

--
-- Name: software_development_intros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.software_development_intros_id_seq OWNED BY public.software_development_intros.id;


--
-- Name: software_development_intros_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.software_development_intros_localizations_links (
    id integer NOT NULL,
    software_development_intro_id integer,
    inv_software_development_intro_id integer,
    software_development_intro_order double precision
);


ALTER TABLE public.software_development_intros_localizations_links OWNER TO postgres;

--
-- Name: software_development_intros_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.software_development_intros_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.software_development_intros_localizations_links_id_seq OWNER TO postgres;

--
-- Name: software_development_intros_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.software_development_intros_localizations_links_id_seq OWNED BY public.software_development_intros_localizations_links.id;


--
-- Name: software_development_intros_versions_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.software_development_intros_versions_links (
    id integer NOT NULL,
    software_development_intro_id integer,
    inv_software_development_intro_id integer,
    software_development_intro_order double precision
);


ALTER TABLE public.software_development_intros_versions_links OWNER TO postgres;

--
-- Name: software_development_intros_versions_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.software_development_intros_versions_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.software_development_intros_versions_links_id_seq OWNER TO postgres;

--
-- Name: software_development_intros_versions_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.software_development_intros_versions_links_id_seq OWNED BY public.software_development_intros_versions_links.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_id_seq OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions_token_links (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_order double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_links OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_token_links_id_seq OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNED BY public.strapi_api_token_permissions_token_links.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_tokens OWNER TO postgres;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_tokens_id_seq OWNER TO postgres;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO postgres;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_core_store_settings_id_seq OWNER TO postgres;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO postgres;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_database_schema_id_seq OWNER TO postgres;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO postgres;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_migrations_id_seq OWNER TO postgres;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO postgres;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_token_permissions_id_seq OWNER TO postgres;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_token_permissions_token_links (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_order double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_links OWNER TO postgres;

--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_token_permissions_token_links_id_seq OWNER TO postgres;

--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq OWNED BY public.strapi_transfer_token_permissions_token_links.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO postgres;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_tokens_id_seq OWNER TO postgres;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO postgres;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_webhooks_id_seq OWNER TO postgres;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: tv_shows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tv_shows (
    id integer NOT NULL,
    title character varying(255),
    year character varying(255),
    link character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.tv_shows OWNER TO postgres;

--
-- Name: tv_shows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tv_shows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tv_shows_id_seq OWNER TO postgres;

--
-- Name: tv_shows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tv_shows_id_seq OWNED BY public.tv_shows.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_permissions OWNER TO postgres;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_id_seq OWNER TO postgres;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);


ALTER TABLE public.up_permissions_role_links OWNER TO postgres;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_role_links_id_seq OWNER TO postgres;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNED BY public.up_permissions_role_links.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_roles OWNER TO postgres;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_roles_id_seq OWNER TO postgres;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_users OWNER TO postgres;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_id_seq OWNER TO postgres;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users_role_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_order double precision
);


ALTER TABLE public.up_users_role_links OWNER TO postgres;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_role_links_id_seq OWNER TO postgres;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_role_links_id_seq OWNED BY public.up_users_role_links.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.upload_folders OWNER TO postgres;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_id_seq OWNER TO postgres;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders_parent_links (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_order double precision
);


ALTER TABLE public.upload_folders_parent_links OWNER TO postgres;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_parent_links_id_seq OWNER TO postgres;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNED BY public.upload_folders_parent_links.id;


--
-- Name: video_games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.video_games (
    id integer NOT NULL,
    title character varying(255),
    year character varying(255),
    link character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.video_games OWNER TO postgres;

--
-- Name: video_games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.video_games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_games_id_seq OWNER TO postgres;

--
-- Name: video_games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.video_games_id_seq OWNED BY public.video_games.id;


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_links_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_links_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: books_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.books_localizations_links_id_seq'::regclass);


--
-- Name: code_snippets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.code_snippets ALTER COLUMN id SET DEFAULT nextval('public.code_snippets_id_seq'::regclass);


--
-- Name: components_shared_meta_socials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_meta_socials ALTER COLUMN id SET DEFAULT nextval('public.components_shared_meta_socials_id_seq'::regclass);


--
-- Name: components_shared_seos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_seos ALTER COLUMN id SET DEFAULT nextval('public.components_shared_seos_id_seq'::regclass);


--
-- Name: components_shared_seos_components id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_seos_components ALTER COLUMN id SET DEFAULT nextval('public.components_shared_seos_components_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links ALTER COLUMN id SET DEFAULT nextval('public.files_folder_links_id_seq'::regclass);


--
-- Name: files_related_morphs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs ALTER COLUMN id SET DEFAULT nextval('public.files_related_morphs_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: iconlibrary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iconlibrary ALTER COLUMN id SET DEFAULT nextval('public.iconlibrary_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: jobs_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.jobs_localizations_links_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: languages_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.languages_localizations_links_id_seq'::regclass);


--
-- Name: menu_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN id SET DEFAULT nextval('public.menu_items_id_seq'::regclass);


--
-- Name: menu_items_parent_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_parent_links ALTER COLUMN id SET DEFAULT nextval('public.menu_items_parent_links_id_seq'::regclass);


--
-- Name: menu_items_root_menu_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_root_menu_links ALTER COLUMN id SET DEFAULT nextval('public.menu_items_root_menu_links_id_seq'::regclass);


--
-- Name: menus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);


--
-- Name: podcasts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.podcasts ALTER COLUMN id SET DEFAULT nextval('public.podcasts_id_seq'::regclass);


--
-- Name: publications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publications ALTER COLUMN id SET DEFAULT nextval('public.publications_id_seq'::regclass);


--
-- Name: publications_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publications_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.publications_localizations_links_id_seq'::regclass);


--
-- Name: random_facts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.random_facts ALTER COLUMN id SET DEFAULT nextval('public.random_facts_id_seq'::regclass);


--
-- Name: random_facts_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.random_facts_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.random_facts_localizations_links_id_seq'::regclass);


--
-- Name: schools id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools ALTER COLUMN id SET DEFAULT nextval('public.schools_id_seq'::regclass);


--
-- Name: schools_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.schools_localizations_links_id_seq'::regclass);


--
-- Name: skills id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills ALTER COLUMN id SET DEFAULT nextval('public.skills_id_seq'::regclass);


--
-- Name: skills_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.skills_localizations_links_id_seq'::regclass);


--
-- Name: software_development_intros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.software_development_intros ALTER COLUMN id SET DEFAULT nextval('public.software_development_intros_id_seq'::regclass);


--
-- Name: software_development_intros_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.software_development_intros_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.software_development_intros_localizations_links_id_seq'::regclass);


--
-- Name: software_development_intros_versions_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.software_development_intros_versions_links ALTER COLUMN id SET DEFAULT nextval('public.software_development_intros_versions_links_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: tv_shows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tv_shows ALTER COLUMN id SET DEFAULT nextval('public.tv_shows_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_links_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_links_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_links_id_seq'::regclass);


--
-- Name: video_games id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_games ALTER COLUMN id SET DEFAULT nextval('public.video_games_id_seq'::regclass);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (1, 'plugin::upload.read', NULL, '{}', '[]', '2023-08-13 18:13:24.318', '2023-08-13 18:13:24.318', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (2, 'plugin::upload.configure-view', NULL, '{}', '[]', '2023-08-13 18:13:24.332', '2023-08-13 18:13:24.332', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (3, 'plugin::upload.assets.create', NULL, '{}', '[]', '2023-08-13 18:13:24.341', '2023-08-13 18:13:24.341', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (4, 'plugin::upload.assets.update', NULL, '{}', '[]', '2023-08-13 18:13:24.349', '2023-08-13 18:13:24.349', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (5, 'plugin::upload.assets.download', NULL, '{}', '[]', '2023-08-13 18:13:24.357', '2023-08-13 18:13:24.357', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (6, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2023-08-13 18:13:24.366', '2023-08-13 18:13:24.366', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (7, 'plugin::upload.read', NULL, '{}', '["admin::is-creator"]', '2023-08-13 18:13:24.374', '2023-08-13 18:13:24.374', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (8, 'plugin::upload.configure-view', NULL, '{}', '[]', '2023-08-13 18:13:24.382', '2023-08-13 18:13:24.382', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (9, 'plugin::upload.assets.create', NULL, '{}', '[]', '2023-08-13 18:13:24.389', '2023-08-13 18:13:24.389', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (10, 'plugin::upload.assets.update', NULL, '{}', '["admin::is-creator"]', '2023-08-13 18:13:24.396', '2023-08-13 18:13:24.396', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (11, 'plugin::upload.assets.download', NULL, '{}', '[]', '2023-08-13 18:13:24.404', '2023-08-13 18:13:24.404', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (12, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2023-08-13 18:13:24.411', '2023-08-13 18:13:24.411', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (13, 'plugin::content-manager.explorer.create', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}', '[]', '2023-08-13 18:13:24.44', '2023-08-13 18:13:24.44', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (14, 'plugin::content-manager.explorer.read', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}', '[]', '2023-08-13 18:13:24.448', '2023-08-13 18:13:24.448', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (15, 'plugin::content-manager.explorer.update', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}', '[]', '2023-08-13 18:13:24.455', '2023-08-13 18:13:24.455', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (16, 'plugin::content-manager.explorer.delete', 'plugin::users-permissions.user', '{}', '[]', '2023-08-13 18:13:24.469', '2023-08-13 18:13:24.469', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (17, 'plugin::content-manager.single-types.configure-view', NULL, '{}', '[]', '2023-08-13 18:13:24.477', '2023-08-13 18:13:24.477', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (18, 'plugin::content-manager.collection-types.configure-view', NULL, '{}', '[]', '2023-08-13 18:13:24.484', '2023-08-13 18:13:24.484', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (19, 'plugin::content-manager.components.configure-layout', NULL, '{}', '[]', '2023-08-13 18:13:24.492', '2023-08-13 18:13:24.492', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (20, 'plugin::content-type-builder.read', NULL, '{}', '[]', '2023-08-13 18:13:24.5', '2023-08-13 18:13:24.5', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (21, 'plugin::email.settings.read', NULL, '{}', '[]', '2023-08-13 18:13:24.509', '2023-08-13 18:13:24.509', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (22, 'plugin::upload.read', NULL, '{}', '[]', '2023-08-13 18:13:24.517', '2023-08-13 18:13:24.517', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (23, 'plugin::upload.assets.create', NULL, '{}', '[]', '2023-08-13 18:13:24.525', '2023-08-13 18:13:24.525', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (24, 'plugin::upload.assets.update', NULL, '{}', '[]', '2023-08-13 18:13:24.533', '2023-08-13 18:13:24.533', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (25, 'plugin::upload.assets.download', NULL, '{}', '[]', '2023-08-13 18:13:24.541', '2023-08-13 18:13:24.541', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (26, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2023-08-13 18:13:24.549', '2023-08-13 18:13:24.549', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (27, 'plugin::upload.configure-view', NULL, '{}', '[]', '2023-08-13 18:13:24.559', '2023-08-13 18:13:24.559', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (28, 'plugin::upload.settings.read', NULL, '{}', '[]', '2023-08-13 18:13:24.568', '2023-08-13 18:13:24.568', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (29, 'plugin::users-permissions.roles.create', NULL, '{}', '[]', '2023-08-13 18:13:24.576', '2023-08-13 18:13:24.576', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (30, 'plugin::users-permissions.roles.read', NULL, '{}', '[]', '2023-08-13 18:13:24.584', '2023-08-13 18:13:24.584', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (31, 'plugin::users-permissions.roles.update', NULL, '{}', '[]', '2023-08-13 18:13:24.594', '2023-08-13 18:13:24.594', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (32, 'plugin::users-permissions.roles.delete', NULL, '{}', '[]', '2023-08-13 18:13:24.601', '2023-08-13 18:13:24.601', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (33, 'plugin::users-permissions.providers.read', NULL, '{}', '[]', '2023-08-13 18:13:24.608', '2023-08-13 18:13:24.608', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (34, 'plugin::users-permissions.providers.update', NULL, '{}', '[]', '2023-08-13 18:13:24.62', '2023-08-13 18:13:24.62', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (35, 'plugin::users-permissions.email-templates.read', NULL, '{}', '[]', '2023-08-13 18:13:24.627', '2023-08-13 18:13:24.627', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (36, 'plugin::users-permissions.email-templates.update', NULL, '{}', '[]', '2023-08-13 18:13:24.635', '2023-08-13 18:13:24.635', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (37, 'plugin::users-permissions.advanced-settings.read', NULL, '{}', '[]', '2023-08-13 18:13:24.643', '2023-08-13 18:13:24.643', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (38, 'plugin::users-permissions.advanced-settings.update', NULL, '{}', '[]', '2023-08-13 18:13:24.652', '2023-08-13 18:13:24.652', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (39, 'plugin::i18n.locale.create', NULL, '{}', '[]', '2023-08-13 18:13:24.66', '2023-08-13 18:13:24.66', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (40, 'plugin::i18n.locale.read', NULL, '{}', '[]', '2023-08-13 18:13:24.667', '2023-08-13 18:13:24.667', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (41, 'plugin::i18n.locale.update', NULL, '{}', '[]', '2023-08-13 18:13:24.675', '2023-08-13 18:13:24.675', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (42, 'plugin::i18n.locale.delete', NULL, '{}', '[]', '2023-08-13 18:13:24.682', '2023-08-13 18:13:24.682', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (43, 'admin::marketplace.read', NULL, '{}', '[]', '2023-08-13 18:13:24.689', '2023-08-13 18:13:24.689', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (44, 'admin::webhooks.create', NULL, '{}', '[]', '2023-08-13 18:13:24.696', '2023-08-13 18:13:24.696', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (45, 'admin::webhooks.read', NULL, '{}', '[]', '2023-08-13 18:13:24.705', '2023-08-13 18:13:24.705', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (46, 'admin::webhooks.update', NULL, '{}', '[]', '2023-08-13 18:13:24.712', '2023-08-13 18:13:24.712', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (47, 'admin::webhooks.delete', NULL, '{}', '[]', '2023-08-13 18:13:24.719', '2023-08-13 18:13:24.719', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (48, 'admin::users.create', NULL, '{}', '[]', '2023-08-13 18:13:24.727', '2023-08-13 18:13:24.727', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (49, 'admin::users.read', NULL, '{}', '[]', '2023-08-13 18:13:24.734', '2023-08-13 18:13:24.734', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (50, 'admin::users.update', NULL, '{}', '[]', '2023-08-13 18:13:24.742', '2023-08-13 18:13:24.742', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (51, 'admin::users.delete', NULL, '{}', '[]', '2023-08-13 18:13:24.75', '2023-08-13 18:13:24.75', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (52, 'admin::roles.create', NULL, '{}', '[]', '2023-08-13 18:13:24.757', '2023-08-13 18:13:24.757', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (53, 'admin::roles.read', NULL, '{}', '[]', '2023-08-13 18:13:24.765', '2023-08-13 18:13:24.765', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (54, 'admin::roles.update', NULL, '{}', '[]', '2023-08-13 18:13:24.772', '2023-08-13 18:13:24.772', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (55, 'admin::roles.delete', NULL, '{}', '[]', '2023-08-13 18:13:24.78', '2023-08-13 18:13:24.78', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (56, 'admin::api-tokens.access', NULL, '{}', '[]', '2023-08-13 18:13:24.787', '2023-08-13 18:13:24.787', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (57, 'admin::api-tokens.create', NULL, '{}', '[]', '2023-08-13 18:13:24.794', '2023-08-13 18:13:24.794', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (58, 'admin::api-tokens.read', NULL, '{}', '[]', '2023-08-13 18:13:24.802', '2023-08-13 18:13:24.802', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (59, 'admin::api-tokens.update', NULL, '{}', '[]', '2023-08-13 18:13:24.809', '2023-08-13 18:13:24.809', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (60, 'admin::api-tokens.regenerate', NULL, '{}', '[]', '2023-08-13 18:13:24.816', '2023-08-13 18:13:24.816', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (61, 'admin::api-tokens.delete', NULL, '{}', '[]', '2023-08-13 18:13:24.824', '2023-08-13 18:13:24.824', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (62, 'admin::project-settings.update', NULL, '{}', '[]', '2023-08-13 18:13:24.831', '2023-08-13 18:13:24.831', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (63, 'admin::project-settings.read', NULL, '{}', '[]', '2023-08-13 18:13:24.838', '2023-08-13 18:13:24.838', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (64, 'admin::transfer.tokens.access', NULL, '{}', '[]', '2023-08-13 18:13:24.846', '2023-08-13 18:13:24.846', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (65, 'admin::transfer.tokens.create', NULL, '{}', '[]', '2023-08-13 18:13:24.854', '2023-08-13 18:13:24.854', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (66, 'admin::transfer.tokens.read', NULL, '{}', '[]', '2023-08-13 18:13:24.861', '2023-08-13 18:13:24.861', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (67, 'admin::transfer.tokens.update', NULL, '{}', '[]', '2023-08-13 18:13:24.868', '2023-08-13 18:13:24.868', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (68, 'admin::transfer.tokens.regenerate', NULL, '{}', '[]', '2023-08-13 18:13:24.875', '2023-08-13 18:13:24.875', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (69, 'admin::transfer.tokens.delete', NULL, '{}', '[]', '2023-08-13 18:13:24.883', '2023-08-13 18:13:24.883', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (75, 'plugin::content-versioning.save', NULL, '{}', '[]', '2023-08-14 18:43:51.021', '2023-08-14 18:43:51.021', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (76, 'plugin::documentation.read', NULL, '{}', '[]', '2023-08-14 18:43:51.033', '2023-08-14 18:43:51.033', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (77, 'plugin::documentation.settings.update', NULL, '{}', '[]', '2023-08-14 18:43:51.042', '2023-08-14 18:43:51.042', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (78, 'plugin::documentation.settings.regenerate', NULL, '{}', '[]', '2023-08-14 18:43:51.051', '2023-08-14 18:43:51.051', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (79, 'plugin::documentation.settings.read', NULL, '{}', '[]', '2023-08-14 18:43:51.059', '2023-08-14 18:43:51.059', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (80, 'plugin::seo.read', NULL, '{}', '[]', '2023-08-14 18:43:51.068', '2023-08-14 18:43:51.068', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (81, 'plugin::import-export-entries.import', NULL, '{}', '[]', '2023-08-14 18:43:51.077', '2023-08-14 18:43:51.077', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (82, 'plugin::import-export-entries.export', NULL, '{}', '[]', '2023-08-14 18:43:51.084', '2023-08-14 18:43:51.084', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (73, 'plugin::content-manager.explorer.delete', 'api::job.job', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-15 18:14:10.117', '2023-08-15 18:14:10.117', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (74, 'plugin::content-manager.explorer.publish', 'api::job.job', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-15 18:14:10.125', '2023-08-15 18:14:10.125', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (86, 'plugin::content-manager.explorer.create', 'api::job.job', '{"fields": ["companyName", "icon", "title", "location", "startDate", "endDate", "isCurrentJob", "description", "mainColor", "darkColor", "technologies"], "locales": ["en", "de", "it"]}', '[]', '2023-08-17 20:09:44.3', '2023-08-17 20:09:44.3', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (87, 'plugin::content-manager.explorer.read', 'api::job.job', '{"fields": ["companyName", "icon", "title", "location", "startDate", "endDate", "isCurrentJob", "description", "mainColor", "darkColor", "technologies"], "locales": ["en", "de", "it"]}', '[]', '2023-08-17 20:09:44.311', '2023-08-17 20:09:44.311', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (88, 'plugin::content-manager.explorer.update', 'api::job.job', '{"fields": ["companyName", "icon", "title", "location", "startDate", "endDate", "isCurrentJob", "description", "mainColor", "darkColor", "technologies"], "locales": ["en", "de", "it"]}', '[]', '2023-08-17 20:09:44.32', '2023-08-17 20:09:44.32', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (91, 'plugin::content-manager.explorer.create', 'api::podcast.podcast', '{"fields": ["name", "author", "language", "cover", "mediaLink"]}', '[]', '2023-08-19 11:27:15.152', '2023-08-19 11:27:15.152', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (93, 'plugin::content-manager.explorer.create', 'api::school.school', '{"fields": ["schoolName", "flag", "degreeName", "degreeUrl", "grade", "start", "end", "description", "icon"], "locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.167', '2023-08-19 11:27:15.167', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (99, 'plugin::content-manager.explorer.read', 'api::podcast.podcast', '{"fields": ["name", "author", "language", "cover", "mediaLink"]}', '[]', '2023-08-19 11:27:15.209', '2023-08-19 11:27:15.209', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (101, 'plugin::content-manager.explorer.read', 'api::school.school', '{"fields": ["schoolName", "flag", "degreeName", "degreeUrl", "grade", "start", "end", "description", "icon"], "locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.222', '2023-08-19 11:27:15.222', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (107, 'plugin::content-manager.explorer.update', 'api::podcast.podcast', '{"fields": ["name", "author", "language", "cover", "mediaLink"]}', '[]', '2023-08-19 11:27:15.262', '2023-08-19 11:27:15.262', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (109, 'plugin::content-manager.explorer.update', 'api::school.school', '{"fields": ["schoolName", "flag", "degreeName", "degreeUrl", "grade", "start", "end", "description", "icon"], "locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.275', '2023-08-19 11:27:15.275', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (113, 'plugin::content-manager.explorer.delete', 'api::book.book', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.304', '2023-08-19 11:27:15.304', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (114, 'plugin::content-manager.explorer.delete', 'api::language.language', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.311', '2023-08-19 11:27:15.311', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (115, 'plugin::content-manager.explorer.delete', 'api::podcast.podcast', '{}', '[]', '2023-08-19 11:27:15.318', '2023-08-19 11:27:15.318', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (116, 'plugin::content-manager.explorer.delete', 'api::publication.publication', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.324', '2023-08-19 11:27:15.324', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (117, 'plugin::content-manager.explorer.delete', 'api::school.school', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.33', '2023-08-19 11:27:15.33', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (118, 'plugin::content-manager.explorer.delete', 'api::skill.skill', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.338', '2023-08-19 11:27:15.338', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (119, 'plugin::content-manager.explorer.delete', 'api::tv-show.tv-show', '{}', '[]', '2023-08-19 11:27:15.344', '2023-08-19 11:27:15.344', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (120, 'plugin::content-manager.explorer.delete', 'api::video-game.video-game', '{}', '[]', '2023-08-19 11:27:15.351', '2023-08-19 11:27:15.351', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (121, 'plugin::content-manager.explorer.publish', 'api::book.book', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.357', '2023-08-19 11:27:15.357', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (122, 'plugin::content-manager.explorer.publish', 'api::language.language', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.364', '2023-08-19 11:27:15.364', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (123, 'plugin::content-manager.explorer.publish', 'api::podcast.podcast', '{}', '[]', '2023-08-19 11:27:15.372', '2023-08-19 11:27:15.372', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (124, 'plugin::content-manager.explorer.publish', 'api::publication.publication', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.378', '2023-08-19 11:27:15.378', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (125, 'plugin::content-manager.explorer.publish', 'api::school.school', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.385', '2023-08-19 11:27:15.385', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (126, 'plugin::content-manager.explorer.publish', 'api::skill.skill', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.391', '2023-08-19 11:27:15.391', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (127, 'plugin::content-manager.explorer.publish', 'api::tv-show.tv-show', '{}', '[]', '2023-08-19 11:27:15.398', '2023-08-19 11:27:15.398', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (128, 'plugin::content-manager.explorer.publish', 'api::video-game.video-game', '{}', '[]', '2023-08-19 11:27:15.405', '2023-08-19 11:27:15.405', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (129, 'plugin::content-manager.explorer.create', 'api::book.book', '{"fields": ["title", "author", "cover", "goodreadsLink", "genre", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-08-19 12:17:58.256', '2023-08-19 12:17:58.256', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (130, 'plugin::content-manager.explorer.read', 'api::book.book', '{"fields": ["title", "author", "cover", "goodreadsLink", "genre", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-08-19 12:17:58.267', '2023-08-19 12:17:58.267', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (131, 'plugin::content-manager.explorer.update', 'api::book.book', '{"fields": ["title", "author", "cover", "goodreadsLink", "genre", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-08-19 12:17:58.274', '2023-08-19 12:17:58.274', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (133, 'plugin::content-manager.explorer.create', 'api::language.language', '{"fields": ["name", "level", "flag", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-08-22 15:10:41.252', '2023-08-22 15:10:41.252', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (135, 'plugin::content-manager.explorer.read', 'api::language.language', '{"fields": ["name", "level", "flag", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-08-22 15:10:41.269', '2023-08-22 15:10:41.269', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (137, 'plugin::content-manager.explorer.update', 'api::language.language', '{"fields": ["name", "level", "flag", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-08-22 15:10:41.286', '2023-08-22 15:10:41.286', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (138, 'plugin::content-manager.explorer.delete', 'api::code-snippet.code-snippet', '{}', '[]', '2023-08-22 15:10:41.293', '2023-08-22 15:10:41.293', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (139, 'plugin::content-manager.explorer.publish', 'api::code-snippet.code-snippet', '{}', '[]', '2023-08-22 15:10:41.3', '2023-08-22 15:10:41.3', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (149, 'plugin::content-manager.explorer.create', 'api::publication.publication', '{"fields": ["title", "description", "publisher", "file", "year", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-08-22 19:16:44.573', '2023-08-22 19:16:44.573', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (150, 'plugin::content-manager.explorer.read', 'api::publication.publication', '{"fields": ["title", "description", "publisher", "file", "year", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-08-22 19:16:44.586', '2023-08-22 19:16:44.586', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (151, 'plugin::content-manager.explorer.update', 'api::publication.publication', '{"fields": ["title", "description", "publisher", "file", "year", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-08-22 19:16:44.596', '2023-08-22 19:16:44.596', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (152, 'plugin::content-manager.explorer.create', 'api::skill.skill', '{"fields": ["title", "description", "icons", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-08-22 19:36:16.294', '2023-08-22 19:36:16.294', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (153, 'plugin::content-manager.explorer.read', 'api::skill.skill', '{"fields": ["title", "description", "icons", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-08-22 19:36:16.306', '2023-08-22 19:36:16.306', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (154, 'plugin::content-manager.explorer.update', 'api::skill.skill', '{"fields": ["title", "description", "icons", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-08-22 19:36:16.314', '2023-08-22 19:36:16.314', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (155, 'plugin::content-manager.explorer.create', 'api::software-development-intro.software-development-intro', '{"fields": ["title", "content", "icon"], "locales": ["en", "de", "it"]}', '[]', '2023-08-22 19:54:56.412', '2023-08-22 19:54:56.412', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (156, 'plugin::content-manager.explorer.read', 'api::software-development-intro.software-development-intro', '{"fields": ["title", "content", "icon"], "locales": ["en", "de", "it"]}', '[]', '2023-08-22 19:54:56.424', '2023-08-22 19:54:56.424', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (157, 'plugin::content-manager.explorer.update', 'api::software-development-intro.software-development-intro', '{"fields": ["title", "content", "icon"], "locales": ["en", "de", "it"]}', '[]', '2023-08-22 19:54:56.432', '2023-08-22 19:54:56.432', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (158, 'plugin::content-manager.explorer.delete', 'api::software-development-intro.software-development-intro', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-22 19:54:56.441', '2023-08-22 19:54:56.441', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (159, 'plugin::content-manager.explorer.publish', 'api::software-development-intro.software-development-intro', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-22 19:54:56.45', '2023-08-22 19:54:56.45', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (160, 'plugin::content-manager.explorer.create', 'api::code-snippet.code-snippet', '{"fields": ["language", "code"]}', '[]', '2023-08-22 20:04:23.389', '2023-08-22 20:04:23.389', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (161, 'plugin::content-manager.explorer.read', 'api::code-snippet.code-snippet', '{"fields": ["language", "code"]}', '[]', '2023-08-22 20:04:23.4', '2023-08-22 20:04:23.4', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (162, 'plugin::content-manager.explorer.update', 'api::code-snippet.code-snippet', '{"fields": ["language", "code"]}', '[]', '2023-08-22 20:04:23.41', '2023-08-22 20:04:23.41', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (163, 'plugin::content-manager.explorer.create', 'api::tv-show.tv-show', '{"fields": ["title", "poster", "link", "year"]}', '[]', '2023-08-23 16:33:26.558', '2023-08-23 16:33:26.558', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (164, 'plugin::content-manager.explorer.create', 'api::video-game.video-game', '{"fields": ["title", "cover", "link", "year"]}', '[]', '2023-08-23 16:33:26.571', '2023-08-23 16:33:26.571', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (165, 'plugin::content-manager.explorer.read', 'api::tv-show.tv-show', '{"fields": ["title", "poster", "link", "year"]}', '[]', '2023-08-23 16:33:26.579', '2023-08-23 16:33:26.579', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (166, 'plugin::content-manager.explorer.read', 'api::video-game.video-game', '{"fields": ["title", "cover", "link", "year"]}', '[]', '2023-08-23 16:33:26.588', '2023-08-23 16:33:26.588', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (167, 'plugin::content-manager.explorer.update', 'api::tv-show.tv-show', '{"fields": ["title", "poster", "link", "year"]}', '[]', '2023-08-23 16:33:26.595', '2023-08-23 16:33:26.595', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (168, 'plugin::content-manager.explorer.update', 'api::video-game.video-game', '{"fields": ["title", "cover", "link", "year"]}', '[]', '2023-08-23 16:33:26.604', '2023-08-23 16:33:26.604', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (169, 'plugin::content-manager.explorer.create', 'api::random-fact.random-fact', '{"fields": ["name", "headline", "description", "isFactTrue", "explanation"], "locales": ["en", "de", "it"]}', '[]', '2023-08-23 17:25:48.6', '2023-08-23 17:25:48.6', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (170, 'plugin::content-manager.explorer.read', 'api::random-fact.random-fact', '{"fields": ["name", "headline", "description", "isFactTrue", "explanation"], "locales": ["en", "de", "it"]}', '[]', '2023-08-23 17:25:48.614', '2023-08-23 17:25:48.614', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (171, 'plugin::content-manager.explorer.update', 'api::random-fact.random-fact', '{"fields": ["name", "headline", "description", "isFactTrue", "explanation"], "locales": ["en", "de", "it"]}', '[]', '2023-08-23 17:25:48.623', '2023-08-23 17:25:48.623', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (172, 'plugin::content-manager.explorer.delete', 'api::random-fact.random-fact', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-23 17:25:48.631', '2023-08-23 17:25:48.631', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (173, 'plugin::content-manager.explorer.publish', 'api::random-fact.random-fact', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-23 17:25:48.64', '2023-08-23 17:25:48.64', NULL, NULL);


--
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (1, 1, 2, 1);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (2, 2, 2, 2);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (3, 3, 2, 3);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (4, 4, 2, 4);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (5, 5, 2, 5);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (6, 6, 2, 6);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (7, 7, 3, 1);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (8, 8, 3, 2);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (9, 9, 3, 3);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (10, 10, 3, 4);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (11, 11, 3, 5);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (12, 12, 3, 6);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (13, 13, 1, 1);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (14, 14, 1, 2);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (15, 15, 1, 3);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (16, 16, 1, 4);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (17, 17, 1, 5);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (18, 18, 1, 6);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (19, 19, 1, 7);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (20, 20, 1, 8);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (21, 21, 1, 9);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (22, 22, 1, 10);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (23, 23, 1, 11);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (24, 24, 1, 12);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (25, 25, 1, 13);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (26, 26, 1, 14);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (27, 27, 1, 15);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (28, 28, 1, 16);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (29, 29, 1, 17);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (30, 30, 1, 18);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (31, 31, 1, 19);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (32, 32, 1, 20);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (33, 33, 1, 21);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (34, 34, 1, 22);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (35, 35, 1, 23);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (36, 36, 1, 24);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (37, 37, 1, 25);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (38, 38, 1, 26);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (39, 39, 1, 27);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (40, 40, 1, 28);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (41, 41, 1, 29);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (42, 42, 1, 30);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (43, 43, 1, 31);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (44, 44, 1, 32);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (45, 45, 1, 33);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (46, 46, 1, 34);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (47, 47, 1, 35);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (48, 48, 1, 36);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (49, 49, 1, 37);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (50, 50, 1, 38);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (51, 51, 1, 39);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (52, 52, 1, 40);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (53, 53, 1, 41);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (54, 54, 1, 42);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (55, 55, 1, 43);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (56, 56, 1, 44);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (57, 57, 1, 45);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (58, 58, 1, 46);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (59, 59, 1, 47);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (60, 60, 1, 48);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (61, 61, 1, 49);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (62, 62, 1, 50);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (63, 63, 1, 51);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (64, 64, 1, 52);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (65, 65, 1, 53);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (66, 66, 1, 54);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (67, 67, 1, 55);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (68, 68, 1, 56);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (69, 69, 1, 57);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (75, 75, 1, 63);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (76, 76, 1, 64);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (77, 77, 1, 65);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (78, 78, 1, 66);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (79, 79, 1, 67);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (80, 80, 1, 68);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (81, 81, 1, 69);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (82, 82, 1, 70);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (92, 73, 1, 72);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (93, 74, 1, 73);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (96, 86, 1, 74);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (97, 87, 1, 75);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (98, 88, 1, 76);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (101, 91, 1, 79);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (103, 93, 1, 81);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (109, 99, 1, 87);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (111, 101, 1, 89);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (117, 107, 1, 95);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (119, 109, 1, 97);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (123, 113, 1, 101);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (124, 114, 1, 102);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (125, 115, 1, 103);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (126, 116, 1, 104);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (127, 117, 1, 105);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (128, 118, 1, 106);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (129, 119, 1, 107);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (130, 120, 1, 108);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (131, 121, 1, 109);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (132, 122, 1, 110);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (133, 123, 1, 111);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (134, 124, 1, 112);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (135, 125, 1, 113);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (136, 126, 1, 114);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (137, 127, 1, 115);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (138, 128, 1, 116);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (139, 129, 1, 117);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (140, 130, 1, 118);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (141, 131, 1, 119);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (143, 133, 1, 121);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (145, 135, 1, 123);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (147, 137, 1, 125);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (148, 138, 1, 126);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (149, 139, 1, 127);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (159, 149, 1, 128);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (160, 150, 1, 129);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (161, 151, 1, 130);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (162, 152, 1, 131);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (163, 153, 1, 132);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (164, 154, 1, 133);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (165, 155, 1, 134);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (166, 156, 1, 135);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (167, 157, 1, 136);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (168, 158, 1, 137);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (169, 159, 1, 138);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (170, 160, 1, 139);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (171, 161, 1, 140);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (172, 162, 1, 141);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (173, 163, 1, 142);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (174, 164, 1, 143);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (175, 165, 1, 144);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (176, 166, 1, 145);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (177, 167, 1, 146);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (178, 168, 1, 147);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (179, 169, 1, 148);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (180, 170, 1, 149);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (181, 171, 1, 150);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (182, 172, 1, 151);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (183, 173, 1, 152);


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) VALUES (1, 'Super Admin', 'strapi-super-admin', 'Super Admins can access and manage all features and settings.', '2023-08-13 18:13:24.294', '2023-08-13 18:13:24.294', NULL, NULL);
INSERT INTO public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) VALUES (2, 'Editor', 'strapi-editor', 'Editors can manage and publish contents including those of other users.', '2023-08-13 18:13:24.306', '2023-08-13 18:13:24.306', NULL, NULL);
INSERT INTO public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) VALUES (3, 'Author', 'strapi-author', 'Authors can manage the content they have created.', '2023-08-13 18:13:24.312', '2023-08-13 18:13:24.312', NULL, NULL);


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) VALUES (1, 'Marta', 'Pancaldi', NULL, 'marta_panc@me.com', '$2a$10$adTxPcKcLUqtx09.BJ4lcuNHC0FSE.jsy.ICQBIeKBMwISrc4H1IK', NULL, NULL, true, false, NULL, '2023-08-13 20:43:46.532', '2023-08-13 20:43:46.532', NULL, NULL);


--
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_users_roles_links (id, user_id, role_id, role_order, user_order) VALUES (1, 1, 1, 1, 1);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.books (id, title, author, goodreads_link, genre, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (1, 'The Lord of the Rings', 'Tolkien', 'https://www.goodreads.com/book/show/33.The_Lord_of_the_Rings', 'Fiction', '2023-08-23 13:47:54.821', '2023-08-23 13:47:56.045', '2023-08-23 13:47:56.038', 1, 1, 'en', NULL);
INSERT INTO public.books (id, title, author, goodreads_link, genre, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (2, 'The Handmaid''s Tale', 'Atwood, Margaret', 'https://www.goodreads.com/book/show/38447.The_Handmaid_s_Tale', 'Fiction', '2023-08-23 13:55:20.383', '2023-08-23 13:55:23.705', '2023-08-23 13:55:23.698', 1, 1, 'en', NULL);
INSERT INTO public.books (id, title, author, goodreads_link, genre, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (3, 'The God Delusion', 'Dawkins, Richard', 'https://www.goodreads.com/book/show/14743.The_God_Delusion', 'Non-fiction', '2023-08-23 13:55:49.926', '2023-08-23 13:55:50.785', '2023-08-23 13:55:50.779', 1, 1, 'en', NULL);
INSERT INTO public.books (id, title, author, goodreads_link, genre, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (4, 'Polissena del Porcello', 'Pitzorno, Bianca', 'https://www.goodreads.com/book/show/7667075-polissena-del-porcello', 'Fiction', '2023-08-23 13:56:26.035', '2023-08-23 13:56:27.315', '2023-08-23 13:56:27.308', 1, 1, 'en', NULL);
INSERT INTO public.books (id, title, author, goodreads_link, genre, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (5, 'The Hitchhiker''s Guide to the Galaxy', 'Adams, Douglas', 'https://www.goodreads.com/book/show/13.The_Ultimate_Hitchhiker_s_Guide_to_the_Galaxy', 'Fiction', '2023-08-23 13:58:22.934', '2023-08-23 13:58:24.178', '2023-08-23 13:58:24.167', 1, 1, 'en', NULL);
INSERT INTO public.books (id, title, author, goodreads_link, genre, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (6, 'Code Complete', 'McConnell, Steve', 'https://www.goodreads.com/book/show/4845.Code_Complete', 'Non-fiction', '2023-08-23 13:58:49.423', '2023-08-23 13:58:50.46', '2023-08-23 13:58:50.453', 1, 1, 'en', NULL);
INSERT INTO public.books (id, title, author, goodreads_link, genre, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (7, 'Matilda', 'Dahl, Roald', 'https://www.goodreads.com/book/show/39988.Matilda', 'Fiction', '2023-08-23 13:59:18.75', '2023-08-23 13:59:27.417', '2023-08-23 13:59:27.41', 1, 1, 'en', NULL);
INSERT INTO public.books (id, title, author, goodreads_link, genre, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (8, 'Jurassic Park', 'Crichton, Michael', 'https://www.goodreads.com/book/show/40604658-jurassic-park', 'Fiction', '2023-08-23 14:01:09.578', '2023-08-23 14:01:10.927', '2023-08-23 14:01:10.916', 1, 1, 'en', NULL);
INSERT INTO public.books (id, title, author, goodreads_link, genre, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (9, 'https://www.goodreads.com/book/show/4099.The_Pragmatic_Programmer', 'Hunt, Andrew and Thomas, David', 'https://www.goodreads.com/book/show/4099.The_Pragmatic_Programmer', 'Non-fiction', '2023-08-23 14:01:35.187', '2023-08-23 14:01:36.211', '2023-08-23 14:01:36.206', 1, 1, 'en', NULL);


--
-- Data for Name: books_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: code_snippets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.code_snippets (id, code, language, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (2, '<data>
  <name>Marta Pancaldi</name>
  <role>Software Engineer</role>
  <skills>
    <skill>Java</skill>
    <skill>Python</skill>
    <skill>TypeScript</skill>
  </skills>
</data>', 'XML', '2023-08-22 20:09:19.389', '2023-08-22 20:09:20.97', '2023-08-22 20:09:20.964', 1, 1);
INSERT INTO public.code_snippets (id, code, language, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (6, 'marta_pancaldi = SoftwareEngineer(
    role=''Software Engineer'',
    skills=[''Java'', ''Python'', ''NodeJS''],
    age=pow(2 ,4) + 3 * 5 - math.sqrt(9)
)', 'Python', '2023-08-24 15:12:51.769', '2023-08-24 15:57:13.424', '2023-08-24 15:12:53.037', 1, 1);
INSERT INTO public.code_snippets (id, code, language, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (4, '<app-marta-pancaldi 
  [role]="''Software Engineer''"
  [skills]="[''Java'', ''Angular'', ''C#'']"
  [favouriteColor]="''#0047ab''"  
></app-marta-pancaldi>', 'Angular', '2023-08-22 20:10:39.724', '2023-08-24 15:10:11.883', '2023-08-22 20:10:40.849', 1, 1);
INSERT INTO public.code_snippets (id, code, language, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (5, '<MartaPancaldi 
  role={"Software Engineer"} 
  skills={["NodeJS", "Angular", "React"]}
  favouriteColor={"#0047ab"}
/>
', 'React', '2023-08-24 15:11:11.834', '2023-08-24 15:11:13.196', '2023-08-24 15:11:13.192', 1, 1);
INSERT INTO public.code_snippets (id, code, language, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (7, 'INSERT INTO software_engineers
    (name, role, skills, favourite_food)
VALUES
    (''Marta Pancaldi'',
     ''Software Engineer'',
     ''Java, Python, MySQL'',
     ''Pancakes'');', 'SQL', '2023-08-24 15:14:06.575', '2023-08-24 15:14:08.446', '2023-08-24 15:14:08.442', 1, 1);
INSERT INTO public.code_snippets (id, code, language, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (11, '$martaPancaldi = new SoftwareEngineer();
', 'PHP', '2023-08-24 15:21:58.664', '2023-08-24 15:21:59.934', '2023-08-24 15:21:59.93', 1, 1);
INSERT INTO public.code_snippets (id, code, language, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (13, '{
  "name": "Marta Pancaldi",
  "role": "Software Engineer",
  "skills": ["Java", "Python", "TypeScript"],
  "favouritePet": "Hedgehog"
}', 'JSON', '2023-08-24 15:26:12.228', '2023-08-24 15:26:13.414', '2023-08-24 15:26:13.41', 1, 1);
INSERT INTO public.code_snippets (id, code, language, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (14, 'User marta = new User.Builder()
  .name("Marta Pancaldi")
  .role("Software Engineer")
  .skills(List.of("Java", "Kotlin", "NodeJS"))
  .build();
', 'Java', '2023-08-24 15:27:07.86', '2023-08-24 15:27:09.053', '2023-08-24 15:27:09.048', 1, 1);
INSERT INTO public.code_snippets (id, code, language, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (15, 'name: Marta Pancaldi
role: Software Engineer
skills:
  - Java
  - Python
  - TypeScript
  - YAML
', 'YAML', '2023-08-24 15:27:25.362', '2023-08-24 15:29:49.045', '2023-08-24 15:27:37.805', 1, 1);
INSERT INTO public.code_snippets (id, code, language, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (8, 'const marta_pancaldi = new SoftwareEngineer(
  [''Java'', ''TypeScript'', ''NodeJS'', ''React'']
);', 'JavaScript', '2023-08-24 15:16:20.154', '2023-08-24 15:32:06.461', '2023-08-24 15:17:19.989', 1, 1);
INSERT INTO public.code_snippets (id, code, language, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (10, 'name,role,likesDarkMode
Marta Pancaldi,Software Engineer,true', 'CSV', '2023-08-24 15:21:37.001', '2023-08-24 15:50:06.592', '2023-08-24 15:21:38.413', 1, 1);
INSERT INTO public.code_snippets (id, code, language, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (12, 'val softwareEngineer = SoftwareEngineer(
    name = "Marta Pancaldi",
    skills = listOf("Java", "Python", "Kotlin"),
    favouriteAnimal = ''🐢''
)', 'Kotlin', '2023-08-24 15:25:34.464', '2023-08-24 15:52:05.417', '2023-08-24 15:25:35.677', 1, 1);
INSERT INTO public.code_snippets (id, code, language, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (9, 'SoftwareEngineer marta_pancaldi = new SoftwareEngineer(
    new List<string> { "Java", "Python", "C#" },
);', 'C#', '2023-08-24 15:20:54.49', '2023-08-24 15:55:48.799', '2023-08-24 15:20:55.582', 1, 1);


--
-- Data for Name: components_shared_meta_socials; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: components_shared_seos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: components_shared_seos_components; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (1, 'Resourcify.png', NULL, NULL, 303, 303, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692123344/thumbnail_Resourcify_32e03a1d59.png", "hash": "thumbnail_Resourcify_32e03a1d59", "mime": "image/png", "name": "thumbnail_Resourcify.png", "path": null, "size": 6.25, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_Resourcify_32e03a1d59", "resource_type": "image"}}}', 'Resourcify_32e03a1d59', '.png', 'image/png', 3.36, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692123344/Resourcify_32e03a1d59.png', NULL, 'cloudinary', '{"public_id": "Resourcify_32e03a1d59", "resource_type": "image"}', '/', '2023-08-15 18:15:45.084', '2023-08-17 20:40:20.146', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (2, 'bjss.webp', NULL, NULL, 280, 150, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692645367/thumbnail_bjss_180dc7fdd7.webp", "hash": "thumbnail_bjss_180dc7fdd7", "mime": "image/webp", "name": "thumbnail_bjss.webp", "path": null, "size": 5.04, "width": 245, "height": 131, "provider_metadata": {"public_id": "thumbnail_bjss_180dc7fdd7", "resource_type": "image"}}}', 'bjss_180dc7fdd7', '.webp', 'image/webp', 4.53, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692645367/bjss_180dc7fdd7.webp', NULL, 'cloudinary', '{"public_id": "bjss_180dc7fdd7", "resource_type": "image"}', '/', '2023-08-21 19:16:08.111', '2023-08-21 19:16:08.111', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (3, 'booking.png', NULL, NULL, 920, 900, '{"small": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692645590/small_booking_c2c27e91e2.png", "hash": "small_booking_c2c27e91e2", "mime": "image/png", "name": "small_booking.png", "path": null, "size": 23.42, "width": 500, "height": 489, "provider_metadata": {"public_id": "small_booking_c2c27e91e2", "resource_type": "image"}}, "medium": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692645590/medium_booking_c2c27e91e2.png", "hash": "medium_booking_c2c27e91e2", "mime": "image/png", "name": "medium_booking.png", "path": null, "size": 41.48, "width": 750, "height": 734, "provider_metadata": {"public_id": "medium_booking_c2c27e91e2", "resource_type": "image"}}, "thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692645590/thumbnail_booking_c2c27e91e2.png", "hash": "thumbnail_booking_c2c27e91e2", "mime": "image/png", "name": "thumbnail_booking.png", "path": null, "size": 5.28, "width": 159, "height": 156, "provider_metadata": {"public_id": "thumbnail_booking_c2c27e91e2", "resource_type": "image"}}}', 'booking_c2c27e91e2', '.png', 'image/png', 6.89, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692645590/booking_c2c27e91e2.png', NULL, 'cloudinary', '{"public_id": "booking_c2c27e91e2", "resource_type": "image"}', '/', '2023-08-21 19:19:50.8', '2023-08-21 19:19:50.8', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (4, 'unibz.webp', NULL, NULL, 1200, 1200, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692645740/large_unibz_17557d79d6.webp", "hash": "large_unibz_17557d79d6", "mime": "image/webp", "name": "large_unibz.webp", "path": null, "size": 6.68, "width": 1000, "height": 1000, "provider_metadata": {"public_id": "large_unibz_17557d79d6", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692645740/small_unibz_17557d79d6.webp", "hash": "small_unibz_17557d79d6", "mime": "image/webp", "name": "small_unibz.webp", "path": null, "size": 3.35, "width": 500, "height": 500, "provider_metadata": {"public_id": "small_unibz_17557d79d6", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692645740/medium_unibz_17557d79d6.webp", "hash": "medium_unibz_17557d79d6", "mime": "image/webp", "name": "medium_unibz.webp", "path": null, "size": 4.97, "width": 750, "height": 750, "provider_metadata": {"public_id": "medium_unibz_17557d79d6", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692645740/thumbnail_unibz_17557d79d6.webp", "hash": "thumbnail_unibz_17557d79d6", "mime": "image/webp", "name": "thumbnail_unibz.webp", "path": null, "size": 1.42, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_unibz_17557d79d6", "resource_type": "image"}}}', 'unibz_17557d79d6', '.webp', 'image/webp', 3.61, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692645740/unibz_17557d79d6.webp', NULL, 'cloudinary', '{"public_id": "unibz_17557d79d6", "resource_type": "image"}', '/', '2023-08-21 19:22:20.849', '2023-08-21 19:22:20.849', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (5, 'de.svg', NULL, NULL, 512, 512, NULL, 'de_9c5221adfa', '.svg', 'image/svg+xml', 0.68, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692716604/de_9c5221adfa.svg', NULL, 'cloudinary', '{"public_id": "de_9c5221adfa", "resource_type": "image"}', '/', '2023-08-22 15:03:26.192', '2023-08-22 15:03:26.192', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (7, 'uk.svg', NULL, NULL, 512, 512, NULL, 'uk_657deb6132', '.svg', 'image/svg+xml', 2.27, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692716604/uk_657deb6132.svg', NULL, 'cloudinary', '{"public_id": "uk_657deb6132", "resource_type": "image"}', '/', '2023-08-22 15:03:26.438', '2023-08-22 15:03:26.438', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (8, 'fr.svg', NULL, NULL, 512, 512, NULL, 'fr_eb256cde21', '.svg', 'image/svg+xml', 0.73, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692716604/fr_eb256cde21.svg', NULL, 'cloudinary', '{"public_id": "fr_eb256cde21", "resource_type": "image"}', '/', '2023-08-22 15:03:26.463', '2023-08-22 15:03:26.463', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (10, 'uom.webp', NULL, NULL, 400, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692723652/thumbnail_uom_9c1bfed3b5.webp", "hash": "thumbnail_uom_9c1bfed3b5", "mime": "image/webp", "name": "thumbnail_uom.webp", "path": null, "size": 1.48, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_uom_9c1bfed3b5", "resource_type": "image"}}}', 'uom_9c1bfed3b5', '.webp', 'image/webp', 2.47, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692723652/uom_9c1bfed3b5.webp', NULL, 'cloudinary', '{"public_id": "uom_9c1bfed3b5", "resource_type": "image"}', '/', '2023-08-22 17:00:54.376', '2023-08-22 17:00:54.376', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (6, 'it.svg', NULL, NULL, 512, 512, NULL, 'it_00c57db1fb', '.svg', 'image/svg+xml', 0.80, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692716604/it_00c57db1fb.svg', NULL, 'cloudinary', '{"public_id": "it_00c57db1fb", "resource_type": "image"}', '/', '2023-08-22 15:03:26.214', '2023-08-22 17:03:09.323', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (11, 'unibz-cs.webp', NULL, NULL, 225, 225, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692723921/thumbnail_unibz_cs_5f8e5afb06.webp", "hash": "thumbnail_unibz_cs_5f8e5afb06", "mime": "image/webp", "name": "thumbnail_unibz-cs.webp", "path": null, "size": 1.36, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_unibz_cs_5f8e5afb06", "resource_type": "image"}}}', 'unibz_cs_5f8e5afb06', '.webp', 'image/webp', 1.87, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692723921/unibz_cs_5f8e5afb06.webp', NULL, 'cloudinary', '{"public_id": "unibz_cs_5f8e5afb06", "resource_type": "image"}', '/', '2023-08-22 17:05:22.095', '2023-08-22 17:05:22.095', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (12, 'cofc.webp', NULL, NULL, 100, 100, NULL, 'cofc_c23d3bb7f0', '.webp', 'image/webp', 2.64, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692724050/cofc_c23d3bb7f0.webp', NULL, 'cloudinary', '{"public_id": "cofc_c23d3bb7f0", "resource_type": "image"}', '/', '2023-08-22 17:07:30.46', '2023-08-22 17:07:30.46', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (13, 'peri.webp', NULL, NULL, 100, 100, NULL, 'peri_cff6e0b397', '.webp', 'image/webp', 1.67, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692724050/peri_cff6e0b397.webp', NULL, 'cloudinary', '{"public_id": "peri_cff6e0b397", "resource_type": "image"}', '/', '2023-08-22 17:07:30.73', '2023-08-22 17:07:30.73', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (14, 'us.svg', NULL, NULL, 512, 512, NULL, 'us_f39fa66a76', '.svg', 'image/svg+xml', 3.36, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692724050/us_f39fa66a76.svg', NULL, 'cloudinary', '{"public_id": "us_f39fa66a76", "resource_type": "image"}', '/', '2023-08-22 17:07:31.494', '2023-08-22 17:07:31.494', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (15, 'IEEE.pdf', NULL, NULL, NULL, NULL, NULL, 'IEEE_cb505789df', '.pdf', 'application/pdf', 754.92, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692731283/IEEE_cb505789df.pdf', NULL, 'cloudinary', '{"public_id": "IEEE_cb505789df", "resource_type": "image"}', '/', '2023-08-22 19:08:04.463', '2023-08-22 19:08:04.463', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (16, 'comp61511_dissertation.pdf', NULL, NULL, NULL, NULL, NULL, 'comp61511_dissertation_2efa2eaa90', '.pdf', 'application/pdf', 852.63, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692731486/comp61511_dissertation_2efa2eaa90.pdf', NULL, 'cloudinary', '{"public_id": "comp61511_dissertation_2efa2eaa90", "resource_type": "image"}', '/', '2023-08-22 19:11:26.812', '2023-08-22 19:11:26.812', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (17, 'SATD_Thesis.pdf', NULL, NULL, NULL, NULL, NULL, 'SATD_Thesis_5a590e5a45', '.pdf', 'application/pdf', 1388.43, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692731487/SATD_Thesis_5a590e5a45.pdf', NULL, 'cloudinary', '{"public_id": "SATD_Thesis_5a590e5a45", "resource_type": "image"}', '/', '2023-08-22 19:11:27.697', '2023-08-22 19:11:27.697', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (18, 'python.svg', NULL, NULL, 128, 128, NULL, 'python_bfafede620', '.svg', 'image/svg+xml', 2.17, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692732723/python_bfafede620.svg', NULL, 'cloudinary', '{"public_id": "python_bfafede620", "resource_type": "image"}', '/', '2023-08-22 19:32:04.52', '2023-08-22 19:32:04.52', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (19, 'java.svg', NULL, NULL, 128, 128, NULL, 'java_485a6e1666', '.svg', 'image/svg+xml', 1.54, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692732723/java_485a6e1666.svg', NULL, 'cloudinary', '{"public_id": "java_485a6e1666", "resource_type": "image"}', '/', '2023-08-22 19:32:04.636', '2023-08-22 19:32:04.636', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (20, 'hibernate.svg', NULL, NULL, 256, 256, NULL, 'hibernate_4a990cdba3', '.svg', 'image/svg+xml', 3.60, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692732723/hibernate_4a990cdba3.svg', NULL, 'cloudinary', '{"public_id": "hibernate_4a990cdba3", "resource_type": "image"}', '/', '2023-08-22 19:32:04.714', '2023-08-22 19:32:04.714', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (22, 'code2.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798463/thumbnail_code2_64d12c0ada.webp", "hash": "thumbnail_code2_64d12c0ada", "mime": "image/webp", "name": "thumbnail_code2.webp", "path": null, "size": 3.26, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_code2_64d12c0ada", "resource_type": "image"}}}', 'code2_64d12c0ada', '.webp', 'image/webp', 8.09, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798463/code2_64d12c0ada.webp', NULL, 'cloudinary', '{"public_id": "code2_64d12c0ada", "resource_type": "image"}', '/1', '2023-08-23 13:47:43.461', '2023-08-23 13:47:43.461', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (21, 'laptop.svg', NULL, NULL, 410, 410, NULL, 'laptop_4a3ba3b30c', '.svg', 'image/svg+xml', 7.10, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692734473/laptop_4a3ba3b30c.svg', NULL, 'cloudinary', '{"public_id": "laptop_4a3ba3b30c", "resource_type": "image"}', '/5', '2023-08-22 20:01:14.08', '2023-08-22 20:01:14.08', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (33, 'lotr.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_lotr_9279421c8e.webp", "hash": "thumbnail_lotr_9279421c8e", "mime": "image/webp", "name": "thumbnail_lotr.webp", "path": null, "size": 3.89, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_lotr_9279421c8e", "resource_type": "image"}}}', 'lotr_9279421c8e', '.webp', 'image/webp', 10.82, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/lotr_9279421c8e.webp', NULL, 'cloudinary', '{"public_id": "lotr_9279421c8e", "resource_type": "image"}', '/1', '2023-08-23 13:47:44.944', '2023-08-23 13:47:44.944', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (34, 'jemisin.jpg', NULL, NULL, 314, 475, '{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_jemisin_78142aeb5c.jpg", "hash": "thumbnail_jemisin_78142aeb5c", "mime": "image/jpeg", "name": "thumbnail_jemisin.jpg", "path": null, "size": 6.47, "width": 103, "height": 156, "provider_metadata": {"public_id": "thumbnail_jemisin_78142aeb5c", "resource_type": "image"}}}', 'jemisin_78142aeb5c', '.jpg', 'image/jpeg', 52.11, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/jemisin_78142aeb5c.jpg', NULL, 'cloudinary', '{"public_id": "jemisin_78142aeb5c", "resource_type": "image"}', '/1', '2023-08-23 13:47:44.956', '2023-08-23 13:47:44.956', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (35, 'matilda.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_matilda_66485e3a09.webp", "hash": "thumbnail_matilda_66485e3a09", "mime": "image/webp", "name": "thumbnail_matilda.webp", "path": null, "size": 5.47, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_matilda_66485e3a09", "resource_type": "image"}}}', 'matilda_66485e3a09', '.webp', 'image/webp', 16.62, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/matilda_66485e3a09.webp', NULL, 'cloudinary', '{"public_id": "matilda_66485e3a09", "resource_type": "image"}', '/1', '2023-08-23 13:47:45.002', '2023-08-23 13:47:45.002', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (30, 'atwood.jpg', NULL, NULL, 321, 500, '{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_atwood_7450e7e874.jpg", "hash": "thumbnail_atwood_7450e7e874", "mime": "image/jpeg", "name": "thumbnail_atwood.jpg", "path": null, "size": 4.16, "width": 100, "height": 156, "provider_metadata": {"public_id": "thumbnail_atwood_7450e7e874", "resource_type": "image"}}}', 'atwood_7450e7e874', '.jpg', 'image/jpeg', 37.03, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/atwood_7450e7e874.jpg', NULL, 'cloudinary', '{"public_id": "atwood_7450e7e874", "resource_type": "image"}', '/1', '2023-08-23 13:47:44.894', '2023-08-23 13:47:44.894', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (32, 'adams.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_adams_20547a3b30.webp", "hash": "thumbnail_adams_20547a3b30", "mime": "image/webp", "name": "thumbnail_adams.webp", "path": null, "size": 5.52, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_adams_20547a3b30", "resource_type": "image"}}}', 'adams_20547a3b30', '.webp', 'image/webp', 15.86, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/adams_20547a3b30.webp', NULL, 'cloudinary', '{"public_id": "adams_20547a3b30", "resource_type": "image"}', '/1', '2023-08-23 13:47:44.904', '2023-08-23 13:47:44.904', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (39, 'hp.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_hp_c1578f8fb7.webp", "hash": "thumbnail_hp_c1578f8fb7", "mime": "image/webp", "name": "thumbnail_hp.webp", "path": null, "size": 5.08, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_hp_c1578f8fb7", "resource_type": "image"}}}', 'hp_c1578f8fb7', '.webp', 'image/webp', 14.69, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/hp_c1578f8fb7.webp', NULL, 'cloudinary', '{"public_id": "hp_c1578f8fb7", "resource_type": "image"}', '/1', '2023-08-23 13:47:45.197', '2023-08-23 13:47:45.197', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (40, 'hugo.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_hugo_ed687b31d3.webp", "hash": "thumbnail_hugo_ed687b31d3", "mime": "image/webp", "name": "thumbnail_hugo.webp", "path": null, "size": 5.95, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_hugo_ed687b31d3", "resource_type": "image"}}}', 'hugo_ed687b31d3', '.webp', 'image/webp', 23.00, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/hugo_ed687b31d3.webp', NULL, 'cloudinary', '{"public_id": "hugo_ed687b31d3", "resource_type": "image"}', '/1', '2023-08-23 13:47:45.224', '2023-08-23 13:47:45.224', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (41, 'atwood.webp', NULL, NULL, 321, 459, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_atwood_28fb6b8081.webp", "hash": "thumbnail_atwood_28fb6b8081", "mime": "image/webp", "name": "thumbnail_atwood.webp", "path": null, "size": 4.2, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_atwood_28fb6b8081", "resource_type": "image"}}}', 'atwood_28fb6b8081', '.webp', 'image/webp', 30.54, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/atwood_28fb6b8081.webp', NULL, 'cloudinary', '{"public_id": "atwood_28fb6b8081", "resource_type": "image"}', '/1', '2023-08-23 13:47:45.406', '2023-08-23 13:47:45.406', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (42, 'compass.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_compass_736e477f69.webp", "hash": "thumbnail_compass_736e477f69", "mime": "image/webp", "name": "thumbnail_compass.webp", "path": null, "size": 4.13, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_compass_736e477f69", "resource_type": "image"}}}', 'compass_736e477f69', '.webp', 'image/webp', 12.99, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/compass_736e477f69.webp', NULL, 'cloudinary', '{"public_id": "compass_736e477f69", "resource_type": "image"}', '/1', '2023-08-23 13:47:45.99', '2023-08-23 13:47:45.99', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (31, 'pennac.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_pennac_3c37abc4de.webp", "hash": "thumbnail_pennac_3c37abc4de", "mime": "image/webp", "name": "thumbnail_pennac.webp", "path": null, "size": 5.35, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_pennac_3c37abc4de", "resource_type": "image"}}}', 'pennac_3c37abc4de', '.webp', 'image/webp', 11.94, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/pennac_3c37abc4de.webp', NULL, 'cloudinary', '{"public_id": "pennac_3c37abc4de", "resource_type": "image"}', '/1', '2023-08-23 13:47:44.897', '2023-08-23 13:47:44.897', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (36, 'dawkins.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_dawkins_4b6518de62.webp", "hash": "thumbnail_dawkins_4b6518de62", "mime": "image/webp", "name": "thumbnail_dawkins.webp", "path": null, "size": 5.94, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_dawkins_4b6518de62", "resource_type": "image"}}}', 'dawkins_4b6518de62', '.webp', 'image/webp', 21.54, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/dawkins_4b6518de62.webp', NULL, 'cloudinary', '{"public_id": "dawkins_4b6518de62", "resource_type": "image"}', '/1', '2023-08-23 13:47:45.069', '2023-08-23 13:47:45.069', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (37, 'atheist.jpg', NULL, NULL, 316, 475, '{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_atheist_fac5eb484e.jpg", "hash": "thumbnail_atheist_fac5eb484e", "mime": "image/jpeg", "name": "thumbnail_atheist.jpg", "path": null, "size": 5.55, "width": 104, "height": 156, "provider_metadata": {"public_id": "thumbnail_atheist_fac5eb484e", "resource_type": "image"}}}', 'atheist_fac5eb484e', '.jpg', 'image/jpeg', 32.07, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/atheist_fac5eb484e.jpg', NULL, 'cloudinary', '{"public_id": "atheist_fac5eb484e", "resource_type": "image"}', '/1', '2023-08-23 13:47:45.104', '2023-08-23 13:47:45.104', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (38, 'ende.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_ende_62055bfa83.webp", "hash": "thumbnail_ende_62055bfa83", "mime": "image/webp", "name": "thumbnail_ende.webp", "path": null, "size": 5.54, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_ende_62055bfa83", "resource_type": "image"}}}', 'ende_62055bfa83', '.webp', 'image/webp', 18.15, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/ende_62055bfa83.webp', NULL, 'cloudinary', '{"public_id": "ende_62055bfa83", "resource_type": "image"}', '/1', '2023-08-23 13:47:45.196', '2023-08-23 13:47:45.196', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (23, 'Jurassicpark.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_Jurassicpark_af5900f15d.webp", "hash": "thumbnail_Jurassicpark_af5900f15d", "mime": "image/webp", "name": "thumbnail_Jurassicpark.webp", "path": null, "size": 4.77, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_Jurassicpark_af5900f15d", "resource_type": "image"}}}', 'Jurassicpark_af5900f15d', '.webp', 'image/webp', 12.02, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/Jurassicpark_af5900f15d.webp', NULL, 'cloudinary', '{"public_id": "Jurassicpark_af5900f15d", "resource_type": "image"}', '/1', '2023-08-23 13:47:44.626', '2023-08-23 13:47:44.626', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (24, 'fahren.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_fahren_dc4b71dddc.webp", "hash": "thumbnail_fahren_dc4b71dddc", "mime": "image/webp", "name": "thumbnail_fahren.webp", "path": null, "size": 4.59, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_fahren_dc4b71dddc", "resource_type": "image"}}}', 'fahren_dc4b71dddc', '.webp', 'image/webp', 11.06, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/fahren_dc4b71dddc.webp', NULL, 'cloudinary', '{"public_id": "fahren_dc4b71dddc", "resource_type": "image"}', '/1', '2023-08-23 13:47:44.696', '2023-08-23 13:47:44.696', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (25, 'lotr.jpg', NULL, NULL, 317, 475, '{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_lotr_4515e81b5b.jpg", "hash": "thumbnail_lotr_4515e81b5b", "mime": "image/jpeg", "name": "thumbnail_lotr.jpg", "path": null, "size": 4.82, "width": 104, "height": 156, "provider_metadata": {"public_id": "thumbnail_lotr_4515e81b5b", "resource_type": "image"}}}', 'lotr_4515e81b5b', '.jpg', 'image/jpeg', 34.94, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/lotr_4515e81b5b.jpg', NULL, 'cloudinary', '{"public_id": "lotr_4515e81b5b", "resource_type": "image"}', '/1', '2023-08-23 13:47:44.706', '2023-08-23 13:47:44.706', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (26, 'polissena.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_polissena_5aa8ccf57f.webp", "hash": "thumbnail_polissena_5aa8ccf57f", "mime": "image/webp", "name": "thumbnail_polissena.webp", "path": null, "size": 4.49, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_polissena_5aa8ccf57f", "resource_type": "image"}}}', 'polissena_5aa8ccf57f', '.webp', 'image/webp', 13.49, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/polissena_5aa8ccf57f.webp', NULL, 'cloudinary', '{"public_id": "polissena_5aa8ccf57f", "resource_type": "image"}', '/1', '2023-08-23 13:47:44.727', '2023-08-23 13:47:44.727', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (27, 'pragmatic.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_pragmatic_581747698d.webp", "hash": "thumbnail_pragmatic_581747698d", "mime": "image/webp", "name": "thumbnail_pragmatic.webp", "path": null, "size": 3.8, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_pragmatic_581747698d", "resource_type": "image"}}}', 'pragmatic_581747698d', '.webp', 'image/webp', 14.14, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/pragmatic_581747698d.webp', NULL, 'cloudinary', '{"public_id": "pragmatic_581747698d", "resource_type": "image"}', '/1', '2023-08-23 13:47:44.729', '2023-08-23 13:47:44.729', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (28, 'sh.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_sh_9d36422f12.webp", "hash": "thumbnail_sh_9d36422f12", "mime": "image/webp", "name": "thumbnail_sh.webp", "path": null, "size": 4.65, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_sh_9d36422f12", "resource_type": "image"}}}', 'sh_9d36422f12', '.webp', 'image/webp', 12.23, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/sh_9d36422f12.webp', NULL, 'cloudinary', '{"public_id": "sh_9d36422f12", "resource_type": "image"}', '/1', '2023-08-23 13:47:44.733', '2023-08-23 13:47:44.733', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (29, 'infidel.jpg', NULL, NULL, 314, 475, '{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_infidel_58f9a0b449.jpg", "hash": "thumbnail_infidel_58f9a0b449", "mime": "image/jpeg", "name": "thumbnail_infidel.jpg", "path": null, "size": 4.71, "width": 103, "height": 156, "provider_metadata": {"public_id": "thumbnail_infidel_58f9a0b449", "resource_type": "image"}}}', 'infidel_58f9a0b449', '.jpg', 'image/jpeg', 27.78, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/infidel_58f9a0b449.jpg', NULL, 'cloudinary', '{"public_id": "infidel_58f9a0b449", "resource_type": "image"}', '/1', '2023-08-23 13:47:44.862', '2023-08-23 13:47:44.862', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (43, 'veleno.jpg', NULL, NULL, 500, 500, '{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798588/thumbnail_veleno_c6116f3435.jpg", "hash": "thumbnail_veleno_c6116f3435", "mime": "image/jpeg", "name": "thumbnail_veleno.jpg", "path": null, "size": 5.13, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_veleno_c6116f3435", "resource_type": "image"}}}', 'veleno_c6116f3435', '.jpg', 'image/jpeg', 35.60, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798588/veleno_c6116f3435.jpg', NULL, 'cloudinary', '{"public_id": "veleno_c6116f3435", "resource_type": "image"}', '/2', '2023-08-23 13:49:48.748', '2023-08-23 13:49:48.748', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (44, 'talk_heathen.jpg', NULL, NULL, 528, 528, '{"small": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798588/small_talk_heathen_369ef5f741.jpg", "hash": "small_talk_heathen_369ef5f741", "mime": "image/jpeg", "name": "small_talk_heathen.jpg", "path": null, "size": 11.12, "width": 500, "height": 500, "provider_metadata": {"public_id": "small_talk_heathen_369ef5f741", "resource_type": "image"}}, "thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798588/thumbnail_talk_heathen_369ef5f741.jpg", "hash": "thumbnail_talk_heathen_369ef5f741", "mime": "image/jpeg", "name": "thumbnail_talk_heathen.jpg", "path": null, "size": 2.9, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_talk_heathen_369ef5f741", "resource_type": "image"}}}', 'talk_heathen_369ef5f741', '.jpg', 'image/jpeg', 11.48, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798588/talk_heathen_369ef5f741.jpg', NULL, 'cloudinary', '{"public_id": "talk_heathen_369ef5f741", "resource_type": "image"}', '/2', '2023-08-23 13:49:49.179', '2023-08-23 13:49:49.179', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (45, 'il_dito_di_dio.jpeg', NULL, NULL, 640, 640, '{"small": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/small_il_dito_di_dio_4c3c6ffe38.jpg", "hash": "small_il_dito_di_dio_4c3c6ffe38", "mime": "image/jpeg", "name": "small_il_dito_di_dio.jpeg", "path": null, "size": 37.09, "width": 500, "height": 500, "provider_metadata": {"public_id": "small_il_dito_di_dio_4c3c6ffe38", "resource_type": "image"}}, "thumbnail": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798588/thumbnail_il_dito_di_dio_4c3c6ffe38.jpg", "hash": "thumbnail_il_dito_di_dio_4c3c6ffe38", "mime": "image/jpeg", "name": "thumbnail_il_dito_di_dio.jpeg", "path": null, "size": 6.25, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_il_dito_di_dio_4c3c6ffe38", "resource_type": "image"}}}', 'il_dito_di_dio_4c3c6ffe38', '.jpeg', 'image/jpeg', 54.36, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/il_dito_di_dio_4c3c6ffe38.jpg', NULL, 'cloudinary', '{"public_id": "il_dito_di_dio_4c3c6ffe38", "resource_type": "image"}', '/2', '2023-08-23 13:49:49.303', '2023-08-23 13:49:49.303', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (46, 'daily_cogito.jpg', NULL, NULL, 640, 640, '{"small": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798588/small_daily_cogito_6f5cdb4e84.jpg", "hash": "small_daily_cogito_6f5cdb4e84", "mime": "image/jpeg", "name": "small_daily_cogito.jpg", "path": null, "size": 24.35, "width": 500, "height": 500, "provider_metadata": {"public_id": "small_daily_cogito_6f5cdb4e84", "resource_type": "image"}}, "thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/thumbnail_daily_cogito_6f5cdb4e84.jpg", "hash": "thumbnail_daily_cogito_6f5cdb4e84", "mime": "image/jpeg", "name": "thumbnail_daily_cogito.jpg", "path": null, "size": 5.2, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_daily_cogito_6f5cdb4e84", "resource_type": "image"}}}', 'daily_cogito_6f5cdb4e84', '.jpg', 'image/jpeg', 33.49, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798588/daily_cogito_6f5cdb4e84.jpg', NULL, 'cloudinary', '{"public_id": "daily_cogito_6f5cdb4e84", "resource_type": "image"}', '/2', '2023-08-23 13:49:49.346', '2023-08-23 13:49:49.346', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (47, 'ci_vuole_una_scienza.jpeg', NULL, NULL, 225, 225, '{"thumbnail": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/thumbnail_ci_vuole_una_scienza_a2cc9e540d.jpg", "hash": "thumbnail_ci_vuole_una_scienza_a2cc9e540d", "mime": "image/jpeg", "name": "thumbnail_ci_vuole_una_scienza.jpeg", "path": null, "size": 5.44, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_ci_vuole_una_scienza_a2cc9e540d", "resource_type": "image"}}}', 'ci_vuole_una_scienza_a2cc9e540d', '.jpeg', 'image/jpeg', 8.36, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/ci_vuole_una_scienza_a2cc9e540d.jpg', NULL, 'cloudinary', '{"public_id": "ci_vuole_una_scienza_a2cc9e540d", "resource_type": "image"}', '/2', '2023-08-23 13:49:49.447', '2023-08-23 13:49:49.447', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (48, 'atheist_experience.jpg', NULL, NULL, 176, 176, '{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/thumbnail_atheist_experience_62ad4008b6.jpg", "hash": "thumbnail_atheist_experience_62ad4008b6", "mime": "image/jpeg", "name": "thumbnail_atheist_experience.jpg", "path": null, "size": 4.72, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_atheist_experience_62ad4008b6", "resource_type": "image"}}}', 'atheist_experience_62ad4008b6', '.jpg', 'image/jpeg', 5.41, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/atheist_experience_62ad4008b6.jpg', NULL, 'cloudinary', '{"public_id": "atheist_experience_62ad4008b6", "resource_type": "image"}', '/2', '2023-08-23 13:49:49.457', '2023-08-23 13:49:49.457', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (49, 'da_costa_a_costa.jpeg', NULL, NULL, 640, 640, '{"small": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/small_da_costa_a_costa_05b9889851.jpg", "hash": "small_da_costa_a_costa_05b9889851", "mime": "image/jpeg", "name": "small_da_costa_a_costa.jpeg", "path": null, "size": 17.85, "width": 500, "height": 500, "provider_metadata": {"public_id": "small_da_costa_a_costa_05b9889851", "resource_type": "image"}}, "thumbnail": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/thumbnail_da_costa_a_costa_05b9889851.jpg", "hash": "thumbnail_da_costa_a_costa_05b9889851", "mime": "image/jpeg", "name": "thumbnail_da_costa_a_costa.jpeg", "path": null, "size": 3.96, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_da_costa_a_costa_05b9889851", "resource_type": "image"}}}', 'da_costa_a_costa_05b9889851', '.jpeg', 'image/jpeg', 24.55, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/da_costa_a_costa_05b9889851.jpg', NULL, 'cloudinary', '{"public_id": "da_costa_a_costa_05b9889851", "resource_type": "image"}', '/2', '2023-08-23 13:49:49.526', '2023-08-23 13:49:49.526', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (50, 'indagini.jpeg', NULL, NULL, 640, 640, '{"small": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/small_indagini_4b7b1aa3ab.jpg", "hash": "small_indagini_4b7b1aa3ab", "mime": "image/jpeg", "name": "small_indagini.jpeg", "path": null, "size": 25, "width": 500, "height": 500, "provider_metadata": {"public_id": "small_indagini_4b7b1aa3ab", "resource_type": "image"}}, "thumbnail": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/thumbnail_indagini_4b7b1aa3ab.jpg", "hash": "thumbnail_indagini_4b7b1aa3ab", "mime": "image/jpeg", "name": "thumbnail_indagini.jpeg", "path": null, "size": 4.59, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_indagini_4b7b1aa3ab", "resource_type": "image"}}}', 'indagini_4b7b1aa3ab', '.jpeg', 'image/jpeg', 36.32, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/indagini_4b7b1aa3ab.jpg', NULL, 'cloudinary', '{"public_id": "indagini_4b7b1aa3ab", "resource_type": "image"}', '/2', '2023-08-23 13:49:49.537', '2023-08-23 13:49:49.537', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (51, 'breaking_italy.jpg', NULL, NULL, 1200, 1200, '{"large": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/large_breaking_italy_dd37b452e7.jpg", "hash": "large_breaking_italy_dd37b452e7", "mime": "image/jpeg", "name": "large_breaking_italy.jpg", "path": null, "size": 48.76, "width": 1000, "height": 1000, "provider_metadata": {"public_id": "large_breaking_italy_dd37b452e7", "resource_type": "image"}}, "small": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/small_breaking_italy_dd37b452e7.jpg", "hash": "small_breaking_italy_dd37b452e7", "mime": "image/jpeg", "name": "small_breaking_italy.jpg", "path": null, "size": 20.37, "width": 500, "height": 500, "provider_metadata": {"public_id": "small_breaking_italy_dd37b452e7", "resource_type": "image"}}, "medium": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/medium_breaking_italy_dd37b452e7.jpg", "hash": "medium_breaking_italy_dd37b452e7", "mime": "image/jpeg", "name": "medium_breaking_italy.jpg", "path": null, "size": 33.6, "width": 750, "height": 750, "provider_metadata": {"public_id": "medium_breaking_italy_dd37b452e7", "resource_type": "image"}}, "thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/thumbnail_breaking_italy_dd37b452e7.jpg", "hash": "thumbnail_breaking_italy_dd37b452e7", "mime": "image/jpeg", "name": "thumbnail_breaking_italy.jpg", "path": null, "size": 3.96, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_breaking_italy_dd37b452e7", "resource_type": "image"}}}', 'breaking_italy_dd37b452e7', '.jpg', 'image/jpeg', 62.00, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/breaking_italy_dd37b452e7.jpg', NULL, 'cloudinary', '{"public_id": "breaking_italy_dd37b452e7", "resource_type": "image"}', '/2', '2023-08-23 13:49:49.864', '2023-08-23 13:49:49.864', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (52, 'black-mirror.webp', NULL, NULL, 438, 656, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798617/small_black_mirror_99a33da84e.webp", "hash": "small_black_mirror_99a33da84e", "mime": "image/webp", "name": "small_black-mirror.webp", "path": null, "size": 37.81, "width": 334, "height": 500, "provider_metadata": {"public_id": "small_black_mirror_99a33da84e", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798617/thumbnail_black_mirror_99a33da84e.webp", "hash": "thumbnail_black_mirror_99a33da84e", "mime": "image/webp", "name": "thumbnail_black-mirror.webp", "path": null, "size": 5.85, "width": 104, "height": 156, "provider_metadata": {"public_id": "thumbnail_black_mirror_99a33da84e", "resource_type": "image"}}}', 'black_mirror_99a33da84e', '.webp', 'image/webp', 65.68, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798617/black_mirror_99a33da84e.webp', NULL, 'cloudinary', '{"public_id": "black_mirror_99a33da84e", "resource_type": "image"}', '/3', '2023-08-23 13:50:18.232', '2023-08-23 13:50:18.232', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (53, 'westworld.jpg', NULL, NULL, 420, 623, '{"small": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798618/small_westworld_8e456e5ac2.jpg", "hash": "small_westworld_8e456e5ac2", "mime": "image/jpeg", "name": "small_westworld.jpg", "path": null, "size": 27.03, "width": 337, "height": 500, "provider_metadata": {"public_id": "small_westworld_8e456e5ac2", "resource_type": "image"}}, "thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798618/thumbnail_westworld_8e456e5ac2.jpg", "hash": "thumbnail_westworld_8e456e5ac2", "mime": "image/jpeg", "name": "thumbnail_westworld.jpg", "path": null, "size": 4.65, "width": 105, "height": 156, "provider_metadata": {"public_id": "thumbnail_westworld_8e456e5ac2", "resource_type": "image"}}}', 'westworld_8e456e5ac2', '.jpg', 'image/jpeg', 38.11, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798617/westworld_8e456e5ac2.jpg', NULL, 'cloudinary', '{"public_id": "westworld_8e456e5ac2", "resource_type": "image"}', '/3', '2023-08-23 13:50:18.557', '2023-08-23 13:50:18.557', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (54, 'doctor-who.jpg', NULL, NULL, 473, 709, '{"small": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798618/small_doctor_who_3b73bd0c22.jpg", "hash": "small_doctor_who_3b73bd0c22", "mime": "image/jpeg", "name": "small_doctor-who.jpg", "path": null, "size": 37.37, "width": 334, "height": 500, "provider_metadata": {"public_id": "small_doctor_who_3b73bd0c22", "resource_type": "image"}}, "thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798618/thumbnail_doctor_who_3b73bd0c22.jpg", "hash": "thumbnail_doctor_who_3b73bd0c22", "mime": "image/jpeg", "name": "thumbnail_doctor-who.jpg", "path": null, "size": 5.84, "width": 104, "height": 156, "provider_metadata": {"public_id": "thumbnail_doctor_who_3b73bd0c22", "resource_type": "image"}}}', 'doctor_who_3b73bd0c22', '.jpg', 'image/jpeg', 68.39, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798618/doctor_who_3b73bd0c22.jpg', NULL, 'cloudinary', '{"public_id": "doctor_who_3b73bd0c22", "resource_type": "image"}', '/3', '2023-08-23 13:50:18.615', '2023-08-23 13:50:18.615', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (55, 'sherlock.jpg', NULL, NULL, 400, 600, '{"small": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798618/small_sherlock_9f9a1a3ecd.jpg", "hash": "small_sherlock_9f9a1a3ecd", "mime": "image/jpeg", "name": "small_sherlock.jpg", "path": null, "size": 39.76, "width": 333, "height": 500, "provider_metadata": {"public_id": "small_sherlock_9f9a1a3ecd", "resource_type": "image"}}, "thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798618/thumbnail_sherlock_9f9a1a3ecd.jpg", "hash": "thumbnail_sherlock_9f9a1a3ecd", "mime": "image/jpeg", "name": "thumbnail_sherlock.jpg", "path": null, "size": 5.54, "width": 104, "height": 156, "provider_metadata": {"public_id": "thumbnail_sherlock_9f9a1a3ecd", "resource_type": "image"}}}', 'sherlock_9f9a1a3ecd', '.jpg', 'image/jpeg', 56.56, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798618/sherlock_9f9a1a3ecd.jpg', NULL, 'cloudinary', '{"public_id": "sherlock_9f9a1a3ecd", "resource_type": "image"}', '/3', '2023-08-23 13:50:18.702', '2023-08-23 13:50:18.702', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (57, 'chernobyl.webp', NULL, NULL, 612, 917, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/small_chernobyl_26276e09f5.webp", "hash": "small_chernobyl_26276e09f5", "mime": "image/webp", "name": "small_chernobyl.webp", "path": null, "size": 7.36, "width": 334, "height": 500, "provider_metadata": {"public_id": "small_chernobyl_26276e09f5", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/medium_chernobyl_26276e09f5.webp", "hash": "medium_chernobyl_26276e09f5", "mime": "image/webp", "name": "medium_chernobyl.webp", "path": null, "size": 12.13, "width": 501, "height": 750, "provider_metadata": {"public_id": "medium_chernobyl_26276e09f5", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/thumbnail_chernobyl_26276e09f5.webp", "hash": "thumbnail_chernobyl_26276e09f5", "mime": "image/webp", "name": "thumbnail_chernobyl.webp", "path": null, "size": 1.73, "width": 104, "height": 156, "provider_metadata": {"public_id": "thumbnail_chernobyl_26276e09f5", "resource_type": "image"}}}', 'chernobyl_26276e09f5', '.webp', 'image/webp', 27.75, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/chernobyl_26276e09f5.webp', NULL, 'cloudinary', '{"public_id": "chernobyl_26276e09f5", "resource_type": "image"}', '/3', '2023-08-23 13:52:01.708', '2023-08-23 13:52:01.708', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (65, 'rocket_league.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/thumbnail_rocket_league_40f1eff83f.png", "hash": "thumbnail_rocket_league_40f1eff83f", "mime": "image/png", "name": "thumbnail_rocket_league.png", "path": null, "size": 40.51, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_rocket_league_40f1eff83f", "resource_type": "image"}}}', 'rocket_league_40f1eff83f', '.png', 'image/png', 39.31, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/rocket_league_40f1eff83f.png', NULL, 'cloudinary', '{"public_id": "rocket_league_40f1eff83f", "resource_type": "image"}', '/4', '2023-08-23 16:20:36.783', '2023-08-23 16:20:36.783', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (66, 'rayman_legends.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/thumbnail_rayman_legends_a6c563bbfa.png", "hash": "thumbnail_rayman_legends_a6c563bbfa", "mime": "image/png", "name": "thumbnail_rayman_legends.png", "path": null, "size": 50.11, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_rayman_legends_a6c563bbfa", "resource_type": "image"}}}', 'rayman_legends_a6c563bbfa', '.png', 'image/png', 54.52, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/rayman_legends_a6c563bbfa.png', NULL, 'cloudinary', '{"public_id": "rayman_legends_a6c563bbfa", "resource_type": "image"}', '/4', '2023-08-23 16:20:36.877', '2023-08-23 16:20:36.877', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (58, 'breaking-bad.webp', NULL, NULL, 678, 1000, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/small_breaking_bad_c234310201.webp", "hash": "small_breaking_bad_c234310201", "mime": "image/webp", "name": "small_breaking-bad.webp", "path": null, "size": 30.92, "width": 339, "height": 500, "provider_metadata": {"public_id": "small_breaking_bad_c234310201", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/medium_breaking_bad_c234310201.webp", "hash": "medium_breaking_bad_c234310201", "mime": "image/webp", "name": "medium_breaking-bad.webp", "path": null, "size": 48.85, "width": 508, "height": 750, "provider_metadata": {"public_id": "medium_breaking_bad_c234310201", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/thumbnail_breaking_bad_c234310201.webp", "hash": "thumbnail_breaking_bad_c234310201", "mime": "image/webp", "name": "thumbnail_breaking-bad.webp", "path": null, "size": 4.97, "width": 106, "height": 156, "provider_metadata": {"public_id": "thumbnail_breaking_bad_c234310201", "resource_type": "image"}}}', 'breaking_bad_c234310201', '.webp', 'image/webp', 77.52, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/breaking_bad_c234310201.webp', NULL, 'cloudinary', '{"public_id": "breaking_bad_c234310201", "resource_type": "image"}', '/3', '2023-08-23 13:52:01.834', '2023-08-23 13:52:01.834', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (59, 'better-call-saul.jpg', NULL, NULL, 1320, 1980, '{"large": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/large_better_call_saul_4e68c2794f.jpg", "hash": "large_better_call_saul_4e68c2794f", "mime": "image/jpeg", "name": "large_better-call-saul.jpg", "path": null, "size": 55.33, "width": 667, "height": 1000, "provider_metadata": {"public_id": "large_better_call_saul_4e68c2794f", "resource_type": "image"}}, "small": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/small_better_call_saul_4e68c2794f.jpg", "hash": "small_better_call_saul_4e68c2794f", "mime": "image/jpeg", "name": "small_better-call-saul.jpg", "path": null, "size": 18.57, "width": 333, "height": 500, "provider_metadata": {"public_id": "small_better_call_saul_4e68c2794f", "resource_type": "image"}}, "medium": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/medium_better_call_saul_4e68c2794f.jpg", "hash": "medium_better_call_saul_4e68c2794f", "mime": "image/jpeg", "name": "medium_better-call-saul.jpg", "path": null, "size": 34.43, "width": 500, "height": 750, "provider_metadata": {"public_id": "medium_better_call_saul_4e68c2794f", "resource_type": "image"}}, "thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/thumbnail_better_call_saul_4e68c2794f.jpg", "hash": "thumbnail_better_call_saul_4e68c2794f", "mime": "image/jpeg", "name": "thumbnail_better-call-saul.jpg", "path": null, "size": 3.43, "width": 104, "height": 156, "provider_metadata": {"public_id": "thumbnail_better_call_saul_4e68c2794f", "resource_type": "image"}}}', 'better_call_saul_4e68c2794f', '.jpg', 'image/jpeg', 149.21, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/better_call_saul_4e68c2794f.jpg', NULL, 'cloudinary', '{"public_id": "better_call_saul_4e68c2794f", "resource_type": "image"}', '/3', '2023-08-23 13:52:02.181', '2023-08-23 13:52:02.181', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (60, 'stranger-things.webp', NULL, NULL, 865, 1300, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798865/large_stranger_things_5ead17cfb6.webp", "hash": "large_stranger_things_5ead17cfb6", "mime": "image/webp", "name": "large_stranger-things.webp", "path": null, "size": 140.58, "width": 665, "height": 1000, "provider_metadata": {"public_id": "large_stranger_things_5ead17cfb6", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798865/small_stranger_things_5ead17cfb6.webp", "hash": "small_stranger_things_5ead17cfb6", "mime": "image/webp", "name": "small_stranger-things.webp", "path": null, "size": 43.42, "width": 333, "height": 500, "provider_metadata": {"public_id": "small_stranger_things_5ead17cfb6", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798865/medium_stranger_things_5ead17cfb6.webp", "hash": "medium_stranger_things_5ead17cfb6", "mime": "image/webp", "name": "medium_stranger-things.webp", "path": null, "size": 88.64, "width": 499, "height": 750, "provider_metadata": {"public_id": "medium_stranger_things_5ead17cfb6", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798865/thumbnail_stranger_things_5ead17cfb6.webp", "hash": "thumbnail_stranger_things_5ead17cfb6", "mime": "image/webp", "name": "thumbnail_stranger-things.webp", "path": null, "size": 5.76, "width": 104, "height": 156, "provider_metadata": {"public_id": "thumbnail_stranger_things_5ead17cfb6", "resource_type": "image"}}}', 'stranger_things_5ead17cfb6', '.webp', 'image/webp', 262.88, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798865/stranger_things_5ead17cfb6.webp', NULL, 'cloudinary', '{"public_id": "stranger_things_5ead17cfb6", "resource_type": "image"}', '/3', '2023-08-23 13:54:26.34', '2023-08-23 13:54:26.34', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (61, 'unorthodox.webp', NULL, NULL, 2500, 3704, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798867/large_unorthodox_08431e1d41.webp", "hash": "large_unorthodox_08431e1d41", "mime": "image/webp", "name": "large_unorthodox.webp", "path": null, "size": 45.09, "width": 675, "height": 1000, "provider_metadata": {"public_id": "large_unorthodox_08431e1d41", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798867/small_unorthodox_08431e1d41.webp", "hash": "small_unorthodox_08431e1d41", "mime": "image/webp", "name": "small_unorthodox.webp", "path": null, "size": 15.91, "width": 337, "height": 500, "provider_metadata": {"public_id": "small_unorthodox_08431e1d41", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798867/medium_unorthodox_08431e1d41.webp", "hash": "medium_unorthodox_08431e1d41", "mime": "image/webp", "name": "medium_unorthodox.webp", "path": null, "size": 28.64, "width": 506, "height": 750, "provider_metadata": {"public_id": "medium_unorthodox_08431e1d41", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798866/thumbnail_unorthodox_08431e1d41.webp", "hash": "thumbnail_unorthodox_08431e1d41", "mime": "image/webp", "name": "thumbnail_unorthodox.webp", "path": null, "size": 3.12, "width": 105, "height": 156, "provider_metadata": {"public_id": "thumbnail_unorthodox_08431e1d41", "resource_type": "image"}}}', 'unorthodox_08431e1d41', '.webp', 'image/webp', 455.12, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798867/unorthodox_08431e1d41.webp', NULL, 'cloudinary', '{"public_id": "unorthodox_08431e1d41", "resource_type": "image"}', '/3', '2023-08-23 13:54:28.327', '2023-08-23 13:54:28.327', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (62, 'pokemon_go.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807635/thumbnail_pokemon_go_7aa758899d.png", "hash": "thumbnail_pokemon_go_7aa758899d", "mime": "image/png", "name": "thumbnail_pokemon_go.png", "path": null, "size": 29.29, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_pokemon_go_7aa758899d", "resource_type": "image"}}}', 'pokemon_go_7aa758899d', '.png', 'image/png', 23.73, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807635/pokemon_go_7aa758899d.png', NULL, 'cloudinary', '{"public_id": "pokemon_go_7aa758899d", "resource_type": "image"}', '/4', '2023-08-23 16:20:35.424', '2023-08-23 16:20:35.424', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (63, 'ori2.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807635/thumbnail_ori2_cd61cf3cc3.png", "hash": "thumbnail_ori2_cd61cf3cc3", "mime": "image/png", "name": "thumbnail_ori2.png", "path": null, "size": 52.85, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_ori2_cd61cf3cc3", "resource_type": "image"}}}', 'ori2_cd61cf3cc3', '.png', 'image/png', 62.86, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807635/ori2_cd61cf3cc3.png', NULL, 'cloudinary', '{"public_id": "ori2_cd61cf3cc3", "resource_type": "image"}', '/4', '2023-08-23 16:20:35.643', '2023-08-23 16:20:35.643', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (64, 'croc2.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807635/thumbnail_croc2_bb0eda4c07.png", "hash": "thumbnail_croc2_bb0eda4c07", "mime": "image/png", "name": "thumbnail_croc2.png", "path": null, "size": 50.97, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_croc2_bb0eda4c07", "resource_type": "image"}}}', 'croc2_bb0eda4c07', '.png', 'image/png', 64.85, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807635/croc2_bb0eda4c07.png', NULL, 'cloudinary', '{"public_id": "croc2_bb0eda4c07", "resource_type": "image"}', '/4', '2023-08-23 16:20:35.635', '2023-08-23 16:20:35.635', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (67, 'totk.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/thumbnail_totk_34326b9fd2.png", "hash": "thumbnail_totk_34326b9fd2", "mime": "image/png", "name": "thumbnail_totk.png", "path": null, "size": 51.81, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_totk_34326b9fd2", "resource_type": "image"}}}', 'totk_34326b9fd2', '.png', 'image/png', 58.23, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/totk_34326b9fd2.png', NULL, 'cloudinary', '{"public_id": "totk_34326b9fd2", "resource_type": "image"}', '/4', '2023-08-23 16:20:36.915', '2023-08-23 16:20:36.915', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (68, 'mario_odyssey.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/thumbnail_mario_odyssey_38a577b146.png", "hash": "thumbnail_mario_odyssey_38a577b146", "mime": "image/png", "name": "thumbnail_mario_odyssey.png", "path": null, "size": 50.25, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_mario_odyssey_38a577b146", "resource_type": "image"}}}', 'mario_odyssey_38a577b146', '.png', 'image/png', 63.09, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/mario_odyssey_38a577b146.png', NULL, 'cloudinary', '{"public_id": "mario_odyssey_38a577b146", "resource_type": "image"}', '/4', '2023-08-23 16:20:36.942', '2023-08-23 16:20:36.942', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (69, 'sonic_unleashed.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/thumbnail_sonic_unleashed_812e50583e.png", "hash": "thumbnail_sonic_unleashed_812e50583e", "mime": "image/png", "name": "thumbnail_sonic_unleashed.png", "path": null, "size": 51.71, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_sonic_unleashed_812e50583e", "resource_type": "image"}}}', 'sonic_unleashed_812e50583e', '.png', 'image/png', 50.87, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/sonic_unleashed_812e50583e.png', NULL, 'cloudinary', '{"public_id": "sonic_unleashed_812e50583e", "resource_type": "image"}', '/4', '2023-08-23 16:20:36.981', '2023-08-23 16:20:36.981', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (70, 'detroit_become_human.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/thumbnail_detroit_become_human_8959009d72.png", "hash": "thumbnail_detroit_become_human_8959009d72", "mime": "image/png", "name": "thumbnail_detroit_become_human.png", "path": null, "size": 49.04, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_detroit_become_human_8959009d72", "resource_type": "image"}}}', 'detroit_become_human_8959009d72', '.png', 'image/png', 53.57, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/detroit_become_human_8959009d72.png', NULL, 'cloudinary', '{"public_id": "detroit_become_human_8959009d72", "resource_type": "image"}', '/4', '2023-08-23 16:20:36.983', '2023-08-23 16:20:36.983', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (71, 'ori.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/thumbnail_ori_0a1a63b317.png", "hash": "thumbnail_ori_0a1a63b317", "mime": "image/png", "name": "thumbnail_ori.png", "path": null, "size": 49.92, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_ori_0a1a63b317", "resource_type": "image"}}}', 'ori_0a1a63b317', '.png', 'image/png', 54.67, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/ori_0a1a63b317.png', NULL, 'cloudinary', '{"public_id": "ori_0a1a63b317", "resource_type": "image"}', '/4', '2023-08-23 16:20:37.011', '2023-08-23 16:20:37.011', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (72, 'botw.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/thumbnail_botw_f7e329c460.png", "hash": "thumbnail_botw_f7e329c460", "mime": "image/png", "name": "thumbnail_botw.png", "path": null, "size": 49.51, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_botw_f7e329c460", "resource_type": "image"}}}', 'botw_f7e329c460', '.png', 'image/png', 55.07, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/botw_f7e329c460.png', NULL, 'cloudinary', '{"public_id": "botw_f7e329c460", "resource_type": "image"}', '/4', '2023-08-23 16:20:37.022', '2023-08-23 16:20:37.022', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (73, 'uncharted.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/thumbnail_uncharted_9a0d06f28f.png", "hash": "thumbnail_uncharted_9a0d06f28f", "mime": "image/png", "name": "thumbnail_uncharted.png", "path": null, "size": 48.42, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_uncharted_9a0d06f28f", "resource_type": "image"}}}', 'uncharted_9a0d06f28f', '.png', 'image/png', 58.93, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/uncharted_9a0d06f28f.png', NULL, 'cloudinary', '{"public_id": "uncharted_9a0d06f28f", "resource_type": "image"}', '/4', '2023-08-23 16:20:37.026', '2023-08-23 16:20:37.026', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (74, 'sonic_frontiers.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/thumbnail_sonic_frontiers_450ffb95c8.png", "hash": "thumbnail_sonic_frontiers_450ffb95c8", "mime": "image/png", "name": "thumbnail_sonic_frontiers.png", "path": null, "size": 51.09, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_sonic_frontiers_450ffb95c8", "resource_type": "image"}}}', 'sonic_frontiers_450ffb95c8', '.png', 'image/png', 56.01, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/sonic_frontiers_450ffb95c8.png', NULL, 'cloudinary', '{"public_id": "sonic_frontiers_450ffb95c8", "resource_type": "image"}', '/4', '2023-08-23 16:20:37.058', '2023-08-23 16:20:37.058', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (75, 'guitar_hero.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/thumbnail_guitar_hero_49e94e8748.png", "hash": "thumbnail_guitar_hero_49e94e8748", "mime": "image/png", "name": "thumbnail_guitar_hero.png", "path": null, "size": 43.02, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_guitar_hero_49e94e8748", "resource_type": "image"}}}', 'guitar_hero_49e94e8748', '.png', 'image/png', 49.69, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/guitar_hero_49e94e8748.png', NULL, 'cloudinary', '{"public_id": "guitar_hero_49e94e8748", "resource_type": "image"}', '/4', '2023-08-23 16:20:37.062', '2023-08-23 16:20:37.062', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (76, 'professor_layton.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/thumbnail_professor_layton_de8120a30d.png", "hash": "thumbnail_professor_layton_de8120a30d", "mime": "image/png", "name": "thumbnail_professor_layton.png", "path": null, "size": 52.93, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_professor_layton_de8120a30d", "resource_type": "image"}}}', 'professor_layton_de8120a30d', '.png', 'image/png', 68.95, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/professor_layton_de8120a30d.png', NULL, 'cloudinary', '{"public_id": "professor_layton_de8120a30d", "resource_type": "image"}', '/4', '2023-08-23 16:20:37.084', '2023-08-23 16:20:37.084', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (77, 'portal2.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/thumbnail_portal2_6a21964ea9.png", "hash": "thumbnail_portal2_6a21964ea9", "mime": "image/png", "name": "thumbnail_portal2.png", "path": null, "size": 46.24, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_portal2_6a21964ea9", "resource_type": "image"}}}', 'portal2_6a21964ea9', '.png', 'image/png', 52.24, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/portal2_6a21964ea9.png', NULL, 'cloudinary', '{"public_id": "portal2_6a21964ea9", "resource_type": "image"}', '/4', '2023-08-23 16:20:37.175', '2023-08-23 16:20:37.175', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (78, 'the-last-of-us.webp', NULL, NULL, 2700, 4000, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692888366/large_the_last_of_us_7c834c95f8.webp", "hash": "large_the_last_of_us_7c834c95f8", "mime": "image/webp", "name": "large_the-last-of-us.webp", "path": null, "size": 80.16, "width": 675, "height": 1000, "provider_metadata": {"public_id": "large_the_last_of_us_7c834c95f8", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692888366/small_the_last_of_us_7c834c95f8.webp", "hash": "small_the_last_of_us_7c834c95f8", "mime": "image/webp", "name": "small_the-last-of-us.webp", "path": null, "size": 25.86, "width": 338, "height": 500, "provider_metadata": {"public_id": "small_the_last_of_us_7c834c95f8", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692888366/medium_the_last_of_us_7c834c95f8.webp", "hash": "medium_the_last_of_us_7c834c95f8", "mime": "image/webp", "name": "medium_the-last-of-us.webp", "path": null, "size": 49.51, "width": 506, "height": 750, "provider_metadata": {"public_id": "medium_the_last_of_us_7c834c95f8", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692888365/thumbnail_the_last_of_us_7c834c95f8.webp", "hash": "thumbnail_the_last_of_us_7c834c95f8", "mime": "image/webp", "name": "thumbnail_the-last-of-us.webp", "path": null, "size": 4.04, "width": 105, "height": 156, "provider_metadata": {"public_id": "thumbnail_the_last_of_us_7c834c95f8", "resource_type": "image"}}}', 'the_last_of_us_7c834c95f8', '.webp', 'image/webp', 1029.18, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692888365/the_last_of_us_7c834c95f8.webp', NULL, 'cloudinary', '{"public_id": "the_last_of_us_7c834c95f8", "resource_type": "image"}', '/3', '2023-08-24 14:46:06.746', '2023-08-24 14:46:06.746', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (79, 'the-umbrella-academy.jpg', NULL, NULL, 474, 709, '{"small": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692888601/small_the_umbrella_academy_1c8f0d9cc7.jpg", "hash": "small_the_umbrella_academy_1c8f0d9cc7", "mime": "image/jpeg", "name": "small_the-umbrella-academy.jpg", "path": null, "size": 42.17, "width": 334, "height": 500, "provider_metadata": {"public_id": "small_the_umbrella_academy_1c8f0d9cc7", "resource_type": "image"}}, "thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692888601/thumbnail_the_umbrella_academy_1c8f0d9cc7.jpg", "hash": "thumbnail_the_umbrella_academy_1c8f0d9cc7", "mime": "image/jpeg", "name": "thumbnail_the-umbrella-academy.jpg", "path": null, "size": 5.77, "width": 104, "height": 156, "provider_metadata": {"public_id": "thumbnail_the_umbrella_academy_1c8f0d9cc7", "resource_type": "image"}}}', 'the_umbrella_academy_1c8f0d9cc7', '.jpg', 'image/jpeg', 79.40, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692888601/the_umbrella_academy_1c8f0d9cc7.jpg', NULL, 'cloudinary', '{"public_id": "the_umbrella_academy_1c8f0d9cc7", "resource_type": "image"}', '/3', '2023-08-24 14:50:01.921', '2023-08-24 14:50:01.921', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (80, 'school.svg', NULL, NULL, 501, 501, NULL, 'school_bbe225685d', '.svg', 'image/svg+xml', 2.86, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692894192/school_bbe225685d.svg', NULL, 'cloudinary', '{"public_id": "school_bbe225685d", "resource_type": "image"}', '/5', '2023-08-24 16:23:13.834', '2023-08-24 16:23:13.834', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (81, 'internet.svg', NULL, NULL, 512, 512, NULL, 'internet_60bf166c34', '.svg', 'image/svg+xml', 2.88, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692894192/internet_60bf166c34.svg', NULL, 'cloudinary', '{"public_id": "internet_60bf166c34", "resource_type": "image"}', '/5', '2023-08-24 16:23:13.869', '2023-08-24 16:23:13.869', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (82, 'work.svg', NULL, NULL, 512, 512, NULL, 'work_f1bb1eb3dd', '.svg', 'image/svg+xml', 0.82, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692894192/work_f1bb1eb3dd.svg', NULL, 'cloudinary', '{"public_id": "work_f1bb1eb3dd", "resource_type": "image"}', '/5', '2023-08-24 16:23:14.064', '2023-08-24 16:23:14.064', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (83, 'newspaper.svg', NULL, NULL, 512, 512, NULL, 'newspaper_e15ec94d21', '.svg', 'image/svg+xml', 1.68, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692894192/newspaper_e15ec94d21.svg', NULL, 'cloudinary', '{"public_id": "newspaper_e15ec94d21", "resource_type": "image"}', '/5', '2023-08-24 16:23:14.141', '2023-08-24 16:23:14.141', 1, 1);


--
-- Data for Name: files_folder_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (1, 33, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (2, 34, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (3, 35, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (4, 36, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (5, 37, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (6, 38, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (7, 39, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (8, 40, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (9, 41, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (10, 42, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (11, 23, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (12, 24, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (13, 25, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (14, 26, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (15, 27, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (16, 28, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (17, 29, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (18, 30, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (19, 32, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (20, 31, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (21, 22, 1, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (22, 43, 2, 1);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (23, 44, 2, 2);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (24, 45, 2, 3);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (25, 46, 2, 4);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (26, 47, 2, 5);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (27, 48, 2, 6);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (28, 49, 2, 7);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (29, 50, 2, 8);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (30, 51, 2, 9);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (31, 52, 3, 1);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (32, 53, 3, 2);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (33, 54, 3, 3);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (34, 55, 3, 4);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (36, 57, 3, 6);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (37, 58, 3, 7);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (38, 59, 3, 8);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (39, 60, 3, 9);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (40, 61, 3, 10);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (41, 62, 4, 1);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (42, 63, 4, 2);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (43, 64, 4, 3);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (44, 65, 4, 4);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (45, 66, 4, 5);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (46, 67, 4, 6);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (47, 68, 4, 7);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (48, 69, 4, 8);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (49, 70, 4, 9);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (50, 71, 4, 10);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (51, 72, 4, 11);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (52, 73, 4, 11);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (53, 74, 4, 12);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (54, 75, 4, 12);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (55, 76, 4, 13);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (56, 77, 4, 14);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (57, 78, 3, 11);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (58, 79, 3, 12);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (59, 21, 5, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (60, 80, 5, 1);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (61, 81, 5, 2);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (62, 82, 5, 3);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (63, 83, 5, 4);


--
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (7, 1, 2, 'api::job.job', 'Icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (8, 1, 3, 'api::job.job', 'Icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (15, 4, 6, 'api::job.job', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (16, 1, 2, 'api::job.job', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (17, 1, 3, 'api::job.job', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (20, 3, 5, 'api::job.job', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (21, 7, 1, 'api::language.language', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (22, 8, 2, 'api::language.language', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (23, 5, 3, 'api::language.language', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (24, 6, 4, 'api::language.language', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (25, 2, 4, 'api::job.job', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (30, 7, 1, 'api::school.school', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (31, 10, 1, 'api::school.school', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (32, 6, 2, 'api::school.school', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (33, 11, 2, 'api::school.school', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (34, 14, 3, 'api::school.school', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (35, 12, 3, 'api::school.school', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (36, 6, 4, 'api::school.school', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (37, 13, 4, 'api::school.school', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (42, 16, 4, 'api::publication.publication', 'file', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (43, 15, 2, 'api::publication.publication', 'file', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (44, 17, 3, 'api::publication.publication', 'file', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (46, 18, 1, 'api::skill.skill', 'icons', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (47, 19, 2, 'api::skill.skill', 'icons', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (48, 20, 2, 'api::skill.skill', 'icons', 2);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (49, 21, 1, 'api::software-development-intro.software-development-intro', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (50, 33, 1, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (51, 41, 2, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (52, 36, 3, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (53, 26, 4, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (54, 32, 5, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (55, 22, 6, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (56, 35, 7, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (57, 23, 8, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (58, 27, 9, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (59, 59, 1, 'api::tv-show.tv-show', 'poster', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (60, 52, 6, 'api::tv-show.tv-show', 'poster', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (61, 58, 7, 'api::tv-show.tv-show', 'poster', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (62, 57, 4, 'api::tv-show.tv-show', 'poster', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (63, 54, 9, 'api::tv-show.tv-show', 'poster', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (64, 55, 3, 'api::tv-show.tv-show', 'poster', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (65, 60, 8, 'api::tv-show.tv-show', 'poster', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (66, 61, 2, 'api::tv-show.tv-show', 'poster', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (67, 53, 5, 'api::tv-show.tv-show', 'poster', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (68, 51, 7, 'api::podcast.podcast', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (69, 47, 4, 'api::podcast.podcast', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (70, 49, 6, 'api::podcast.podcast', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (71, 46, 2, 'api::podcast.podcast', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (72, 45, 9, 'api::podcast.podcast', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (73, 50, 3, 'api::podcast.podcast', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (74, 44, 1, 'api::podcast.podcast', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (75, 48, 8, 'api::podcast.podcast', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (76, 43, 5, 'api::podcast.podcast', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (77, 67, 14, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (78, 74, 12, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (79, 62, 16, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (80, 63, 15, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (81, 70, 1, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (82, 72, 4, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (83, 68, 13, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (84, 73, 8, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (85, 71, 6, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (86, 65, 10, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (87, 66, 2, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (88, 77, 3, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (89, 75, 9, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (90, 76, 5, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (91, 69, 11, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (92, 64, 7, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (93, 78, 10, 'api::tv-show.tv-show', 'poster', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (94, 79, 11, 'api::tv-show.tv-show', 'poster', 1);


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) VALUES (1, 'English (en)', 'en', '2023-08-13 18:13:24.252', '2023-08-13 18:13:24.252', NULL, NULL);
INSERT INTO public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) VALUES (2, 'German (de)', 'de', '2023-08-15 18:14:03.309', '2023-08-15 18:14:03.309', 1, 1);
INSERT INTO public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) VALUES (3, 'Italian (it)', 'it', '2023-08-15 18:14:10.006', '2023-08-15 18:14:10.006', 1, 1);


--
-- Data for Name: iconlibrary; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.jobs (id, description, title, company_name, location, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, start_date, end_date, is_current_job, main_color, dark_color, technologies) VALUES (6, 'Academic research about contracts and policies of cloud services, following the changes introduced by the new European law on data protection (GDPR). The article, published on IEEE Cloud Computing, was written in collaboration with law and computer science professors from the Free University of Bolzano and University of Insubria.', 'Research Assistant', 'UniBZ – Faculty of Computer Science', NULL, '2023-08-21 19:26:39.8', '2023-08-21 19:26:41.734', '2023-08-21 19:26:41.722', 1, 1, 'en', '2017-10-01', '2018-03-31', false, '#147AE3', '#b8d8f9', '["Cloud Computing", "GDPR", "SaaS", "Technical Writing"]');
INSERT INTO public.jobs (id, description, title, company_name, location, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, start_date, end_date, is_current_job, main_color, dark_color, technologies) VALUES (2, '- Europe''s #1 platform for intelligent and sustainable waste and recyclables management
- Started as part of the Recycler API / Platform Core team
- Development of the new accounting platform for the internal use of the company and its clients', 'Full-Stack Engineer', 'Resourcify', 'Hamburg (remote)', '2023-08-14 16:51:46.424', '2023-08-21 19:27:48.243', '2023-08-14 16:51:48.467', 1, 1, 'en', '2022-03-01', NULL, true, '#156970', '#ABEAEF', '["Java", "SpringBoot", "TypeScript", "Angular", "MySQL", "AWS", "Docker", "Kubernetes"]');
INSERT INTO public.jobs (id, description, title, company_name, location, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, start_date, end_date, is_current_job, main_color, dark_color, technologies) VALUES (3, NULL, 'Sviluppatrice Full-Stack', 'Resourcify', 'Amburgo (remoto)', '2023-08-15 18:16:34.39', '2023-08-21 19:27:48.302', '2023-08-15 18:18:02.537', 1, 1, 'it', '2022-03-01', NULL, true, '#156970', '#ABEAEF', '["Java", "SpringBoot", "TypeScript", "Angular", "MySQL", "AWS", "Docker", "Kubernetes"]');
INSERT INTO public.jobs (id, description, title, company_name, location, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, start_date, end_date, is_current_job, main_color, dark_color, technologies) VALUES (5, '- Team rotation every six months: payment page, premium insurance and supplier integrations

- Everyday development follows the Agile principles, in particular the Kanban approach, including activities like pair programming and testing, code reviews, daily stand-ups an retros

- Involved in interviewing students who applied for the Booking.com grad scheme', 'Graduate Software Engineer', 'Booking.com', 'Manchester', '2023-08-21 19:21:48.461', '2023-08-21 19:46:07.374', '2023-08-21 19:21:50.659', 1, 1, 'en', '2018-09-03', '2020-11-30', false, '#043580', '#b6d2fd', '["Java", "SpringBoot", "JavaScript", "React", "NodeJS", "PHP", "MySQL", "Docker", "Kubernetes", "AWS", "GCP"]');
INSERT INTO public.jobs (id, description, title, company_name, location, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, start_date, end_date, is_current_job, main_color, dark_color, technologies) VALUES (4, '- Technology consultancy company

- All the work is project-based, providing opportunities to work with various clients and programming languages and stacks

- Main developer responsible for implementing an updated Cookie & Privacy policy on a client''s EU-based websites

- Support engineer/tester for the Platform team to create a containerised version of the client''s web-app', 'Software Engineer', 'BJSS', 'Manchester (remote)', '2023-08-21 19:19:11.572', '2023-08-22 16:35:45.846', '2023-08-21 19:19:18.961', 1, 1, 'en', '2020-11-02', '2022-03-01', false, '#1447BA', '#CEDCFA', '["PHP", "Drupal", "Java", "JavaScript", "Angular", "Vue", "Google Tag Manager", "Docker", "Jenkins", "Azure"]');


--
-- Data for Name: jobs_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.jobs_localizations_links (id, job_id, inv_job_id, job_order) VALUES (1, 3, 2, 1);
INSERT INTO public.jobs_localizations_links (id, job_id, inv_job_id, job_order) VALUES (2, 2, 3, 1);


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.languages (id, name, level, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (1, 'English', 'Fluent (C2)', '2023-08-22 15:03:36.14', '2023-08-22 15:03:39.48', '2023-08-22 15:03:39.475', 1, 1, 'en', NULL);
INSERT INTO public.languages (id, name, level, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (4, 'Italian', 'Native', '2023-08-22 15:04:46.103', '2023-08-22 15:11:24.434', '2023-08-22 15:05:05.795', 1, 1, 'en', 1);
INSERT INTO public.languages (id, name, level, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (3, 'German', 'Intermediate (B1/B2)', '2023-08-22 15:04:27.848', '2023-08-22 15:11:27.924', '2023-08-22 15:04:29.044', 1, 1, 'en', 2);
INSERT INTO public.languages (id, name, level, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (2, 'French', 'Basic (A2)', '2023-08-22 15:04:02.851', '2023-08-22 15:11:28.102', '2023-08-22 15:04:04.408', 1, 1, 'en', 3);


--
-- Data for Name: languages_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: menu_items_parent_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: menu_items_root_menu_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: podcasts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.podcasts (id, name, author, language, media_link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (7, 'Breaking Italy', 'Alessandro Masala aka Shy', 'it', 'https://open.spotify.com/show/7iTg2xpKFAeiBVA3Zq6e7m', '2023-08-23 14:31:15.84', '2023-08-23 14:31:57.44', '2023-08-23 14:31:57.436', NULL, 1);
INSERT INTO public.podcasts (id, name, author, language, media_link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (4, 'Ci Vuole una Scienza', 'Emanuele Menietti, Beatrice Mautino', 'it', 'https://open.spotify.com/show/2dFnTK83EmwkR6yMYb3uoL', '2023-08-23 14:30:53.157', '2023-08-23 14:32:08.92', '2023-08-23 14:32:08.915', NULL, 1);
INSERT INTO public.podcasts (id, name, author, language, media_link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (6, 'Da Costa a Costa', 'Francesco Costa', 'it', 'https://open.spotify.com/show/5MWgP5N6UPK3IJhYjpwVYq', '2023-08-23 14:31:08.469', '2023-08-23 14:32:41.966', '2023-08-23 14:32:41.961', NULL, 1);
INSERT INTO public.podcasts (id, name, author, language, media_link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (2, 'Daily Cogito', 'Rick DuFer', 'it', 'https://open.spotify.com/show/3CPV6sZxGV3fVuDLbR9uWh', '2023-08-23 14:30:29.665', '2023-08-23 14:32:56.502', '2023-08-23 14:32:56.498', NULL, 1);
INSERT INTO public.podcasts (id, name, author, language, media_link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (9, 'Il Dito di Dio', 'Pablo Trincia', 'it', 'https://open.spotify.com/show/7r4owruhMrR2us6mAN7xDQ', '2023-08-23 14:31:30.284', '2023-08-23 14:33:13.545', '2023-08-23 14:33:13.54', NULL, 1);
INSERT INTO public.podcasts (id, name, author, language, media_link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (3, 'Indagini', 'Stefano Nazi', 'it', 'https://open.spotify.com/playlist/41SG1CEuMMah5oaSKbeDAp', '2023-08-23 14:30:44.388', '2023-08-23 14:33:25.549', '2023-08-23 14:33:25.541', NULL, 1);
INSERT INTO public.podcasts (id, name, author, language, media_link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (1, 'Talk Heathen', 'Atheist Community of Austin', 'en', 'https://open.spotify.com/show/1lxRYcJVq7iatU7mcNRbEH', '2023-08-23 14:30:22.705', '2023-08-23 14:33:38.193', '2023-08-23 14:33:38.189', NULL, 1);
INSERT INTO public.podcasts (id, name, author, language, media_link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (8, 'The Atheist Experience', 'Atheist Community of Austin', 'en', 'https://open.spotify.com/show/770WPA1HnBVJ3b2gzliMDJ', '2023-08-23 14:31:22.73', '2023-08-23 14:33:48.805', '2023-08-23 14:33:48.8', NULL, 1);
INSERT INTO public.podcasts (id, name, author, language, media_link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (5, 'Veleno', 'Pablo Trincia', 'it', 'https://open.spotify.com/show/66fZ8K1hHPhnBrbWxIODEi', '2023-08-23 14:31:00.738', '2023-08-23 14:34:01.673', '2023-08-23 14:34:01.667', NULL, 1);


--
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.publications (id, title, description, publisher, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, year, rank) VALUES (2, 'Cloud Computing and the New EU General Data Protection Regulation', 'Research project', 'IEEE Cloud Computing', '2023-08-22 18:03:03.727', '2023-08-22 19:17:19.814', '2023-08-22 18:03:05.239', 1, 1, 'en', '2018', 1);
INSERT INTO public.publications (id, title, description, publisher, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, year, rank) VALUES (4, 'Automated assessment tools for COMP61511: Software Engineering Concepts in Practice', 'MSc Dissertation', 'University of Manchester', '2023-08-22 19:12:15.407', '2023-08-22 19:17:58.751', '2023-08-22 19:12:16.686', 1, 1, 'en', '2018', 1);
INSERT INTO public.publications (id, title, description, publisher, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, year, rank) VALUES (3, 'Studying the Change Impact of Self-Admitted Technical Debt', 'BSc Dissertation', 'University of Bozen-Bolzano', '2023-08-22 19:11:37.951', '2023-08-22 19:17:58.943', '2023-08-22 19:11:39.537', 1, 1, 'en', '2017', 2);


--
-- Data for Name: publications_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: random_facts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.random_facts (id, name, headline, description, is_fact_true, explanation, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (1, 'SVST & GESS', 'Once I traveled to California for a tour of the Silicon Valley, then to Shanghai to attend a hackathon - all in the span of 3 weeks 🌎', 'The craziest trip of my life? That time I visited San Francisco and the big companies and schools in the Bay Area (Google, Facebook, Linkedin, Logitech, Stanford University, UC Berkeley...) as part of the "[Silicon Valley Study Tour](https://www.siliconvalleystudytour.com/)". I then immediately flew to Shanghai to participate in a Hackathon, [GESS 2017](https://globalsummerschool.org/)... all within a span of less than 3 weeks 🌎', true, 'Yep, definitely the craziest trip of my life so far... 

I visited San Francisco and the big companies and schools in the Bay Area (Google, Facebook, Linkedin, Logitech, Stanford University, UC Berkeley...) as part of the "[Silicon Valley Study Tour](https://www.siliconvalleystudytour.com/)". I then immediately flew to Shanghai to participate in a Hackathon, [GESS 2017](https://globalsummerschool.org/)... all within a span of less than 3 weeks.', '2023-08-23 17:28:10.83', '2023-08-23 17:28:16.512', '2023-08-23 17:28:16.501', 1, 1, 'en');
INSERT INTO public.random_facts (id, name, headline, description, is_fact_true, explanation, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (6, 'Correspondence (False)', 'I was an extra-actor in a movie once ("Correspondence" by G. Tornatore), and I got to meet Jeremy Irons 🤩', '', false, 'That one was mostly true! 

I was an extra in the “Correspondence”, but didn’t have the chance to meet dear Jeremy… to be fair I’m pretty sure that the leading actress, Olga Kurylenko, barely ever interacted with him in person, considering the structure of the movie 🤪 

Still had a fun time anyway, even though the whole experience convinced me never to become an actor… way too much effort! 😅', '2023-08-23 17:33:50.476', '2023-08-23 17:41:09.49', '2023-08-23 17:33:52.102', 1, 1, 'en');
INSERT INTO public.random_facts (id, name, headline, description, is_fact_true, explanation, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (4, 'Karate', 'I''ve got a brown belt in karate after practising it for 6 years 🥋', 'I have a brown belt in karate, which I practised for 6 years 🥋 

I took part in a few local competitions, including the "[Tricolore Youth Olympic Games](http://www.fondazionesport.it/Sezione.jsp?idSezione=50&visscadute=1)" in Reggio Emilia... so be careful when you''re around me 😉

', true, 'That''s correct!

I also took part in a few local competitions, including the "[Tricolore Youth Olympic Games](http://www.fondazionesport.it/Sezione.jsp?idSezione=50&visscadute=1)" in Reggio Emilia... so be careful when you''re around me 😉', '2023-08-23 17:31:18.234', '2023-08-23 17:31:19.866', '2023-08-23 17:31:19.86', 1, 1, 'en');
INSERT INTO public.random_facts (id, name, headline, description, is_fact_true, explanation, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (7, 'Country Names', 'I know flags and capitals of all 195 countries in the world 🇰🇲', NULL, false, 'Haha, nope... not yet at least, but I''m working on it ;) 

I know all 50 States by heart (alphabetically and geographically) though, and can probably name most of the 110 Italian towns along with their codes.', '2023-08-23 17:34:57.356', '2023-08-23 17:54:08.951', '2023-08-23 17:34:58.26', 1, 1, 'en');
INSERT INTO public.random_facts (id, name, headline, description, is_fact_true, explanation, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (5, 'Correspondence (True)', NULL, 'I was an extra-actor in a movie once 🎬  It was "[Correspondence](https://www.imdb.com/title/tt3530978/)" (2016) by Giuseppe Tornatore, and I was part of the university students who sat in the conference hall and walked around the uni campus. 

If you manage to spot me, I promise I''ll autograph your t-shirt 😉', true, 'Correct! I was part of the university students who sat in the conference hall and walked around the uni campus. 

If you manage to spot me, I promise I''ll autograph your t-shirt ;)', '2023-08-23 17:32:24.918', '2023-08-23 18:25:01.32', '2023-08-23 17:32:25.893', 1, 1, 'en');
INSERT INTO public.random_facts (id, name, headline, description, is_fact_true, explanation, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (8, 'Oboe', 'I studied oboe at the music school for more than 12 years 🎶', 'When I studied the oboe at the music school, I occasionally played for some illustrious people - notably, the ex Italian President Giorgio Napolitano, the Nobel prize Dario Fo, the bishop of my hometown, and the singer Luciano Ligabue 🎵 🎸 🎶 🎻

Not so oddly enough, it was usually me who asked them for an autograph, although I was technically the ''star'' and they were the audience...', true, 'That''s correct!

When I studied at the music school, I occasionally played for some illustrious people - notably, the ex Italian President Giorgio Napolitano, the Nobel prize Dario Fo, the bishop of my hometown, and the singer Luciano Ligabue 🎵 🎸 🎶 🎻

Not so oddly enough, it was usually me who asked them for an autograph, although I was technically the ''star'' and they were the audience...', '2023-08-23 17:35:58.464', '2023-08-23 17:36:02.132', '2023-08-23 17:36:02.126', 1, 1, 'en');
INSERT INTO public.random_facts (id, name, headline, description, is_fact_true, explanation, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (9, 'First code', 'I wrote the my first lines of code as a 7 year-old: a simple program in BASIC that displayed a colourful "Happy Birthday" on the screen 💻', NULL, false, 'I wish I had started so early! 

Actually, I began learning computer science in high school, so when I was 14 or 15, and unfortunately the language chosen by my teacher was the ultra-modern (?) Turbo Pascal. 

I don''t regret anything though - if anything that means that even a girl from small beginnings can become a decent programmer 💪', '2023-08-23 17:36:30.093', '2023-08-23 17:36:31.679', '2023-08-23 17:36:31.671', 1, 1, 'en');
INSERT INTO public.random_facts (id, name, headline, description, is_fact_true, explanation, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (10, 'Church', 'I have been officially excommunicated by the Roman Catholic Church ⛪', 'I have been officially excommunicated by the Roman Catholic Church ⛪

At a certain point in my life I realised that I no longer agreed with the dictates of the religion I had grown up in, so I decided to declare it to the Church, and was excommunicated as a consequence... I don''t brag about it, but it feels good to be consistent 😌', true, 'That is accurate! 

At a certain point in my life I realised that I no longer agreed with the dictates of the religion I had grown up in, so I decided to declare it to the Church, and was excommunicated as a consequence... I don''t brag about it, but it feels good to be consistent 😌', '2023-08-23 17:37:05.552', '2023-08-23 17:37:06.884', '2023-08-23 17:37:06.876', 1, 1, 'en');
INSERT INTO public.random_facts (id, name, headline, description, is_fact_true, explanation, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (11, 'Countries visited', 'I have visited a total of 21 countries so far 🗺️', 'I have visited a total of 21 countries so far 🗺️ 

The full list is: Austria, Belgium, China, France, Germany, Iceland, Ireland, Italy, Malta, the Netherlands, Monaco, Poland, Portugal, Russia, San Marino, Slovakia, Spain, Switzerland, United Kingdom, United States, Vatican City.', true, 'Correct! The full list is: Austria, Belgium, China, France, Germany, Iceland, Ireland, Italy, Malta, Monaco, the Netherlands, Poland, Portugal, Russia, San Marino, Slovakia, Spain, Switzerland, United Kingdom, United States, Vatican City.', '2023-08-23 17:59:37.213', '2023-08-23 18:29:56.962', '2023-08-23 17:59:38.274', 1, 1, 'en');
INSERT INTO public.random_facts (id, name, headline, description, is_fact_true, explanation, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (2, 'Covid (True)', NULL, 'I managed to avoid Covid for a good three full years, so I won''t hide the fact that I''m quite proud of this "achievement"... It got me in the end, in April 2023, but still I''m one of those who have lasted the longest in my circle of friends 🦠️', true, NULL, '2023-08-23 17:28:40.085', '2023-08-23 17:40:26.397', '2023-08-23 17:28:41.404', 1, 1, 'en');
INSERT INTO public.random_facts (id, name, headline, description, is_fact_true, explanation, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (3, 'Covid (False)', 'At the time of writing this - August 2023 - I haven''t caught Covid-19 🦠 If I manage not to ever catch it, I''ll consider it a Platinum Trophy™ 🏆', '', false, 'Unfortunately I caught it in April 2023, after thinking I had escaped it 😢

The platinum trophy is gone, but at least I am left with a golden one... after 3 years I think I deserve it :)

', '2023-08-23 17:29:21.659', '2023-08-23 17:40:35.19', '2023-08-23 17:30:04.045', 1, 1, 'en');


--
-- Data for Name: random_facts_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: schools; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.schools (id, school_name, degree_name, degree_url, grade, start, "end", description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (1, 'University of Manchester', 'MSc in Advanced Computer Science', 'https://www.cs.manchester.ac.uk/', 'Distinction', '2017-09-01', '2018-09-01', '- Specialised in Software Engineering: advanced programming, Agile and TDD, design patterns and components

- Elective courses in Data Engineering and IT Governance

- MSc dissertation project on building automated assessment tools for programming exercises', '2023-08-22 17:01:28.107', '2023-08-22 17:05:03.453', '2023-08-22 17:01:30.447', 1, 1, 'en');
INSERT INTO public.schools (id, school_name, degree_name, degree_url, grade, start, "end", description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (2, 'Free University of Bolzano', 'BSc in Computer Science', 'https://www.unibz.it/en/faculties/engineering/bachelor-computer-science/', '106/110', '2014-09-01', '2017-01-07', '- The only Italian university that offers a BSc in Computer Science taught in English

- Trilingual teaching with an international curriculum 🇬🇧 🇮🇹 🇩🇪 

- Among the ten world''s best small universities (Times Higher Education 2017)', '2023-08-22 17:03:14.422', '2023-08-22 17:05:26.832', '2023-08-22 17:03:15.765', 1, 1, 'en');
INSERT INTO public.schools (id, school_name, degree_name, degree_url, grade, start, "end", description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (3, 'College of Charleston', 'Exchange Semester', 'http://compsci.cofc.edu/', '4.0 GPA', '2015-01-08', '2016-01-01', '- Funded by the UniBZ "Erasmus+/Overseas" scholarship for international studies
- Main courses: Software Engineering, Networks, Statistical Methods, Discrete Maths and Calculus
- Principal Oboe of the College orchestra', '2023-08-22 17:07:41.915', '2023-08-22 17:07:43.66', '2023-08-22 17:07:43.654', 1, 1, 'en');
INSERT INTO public.schools (id, school_name, degree_name, degree_url, grade, start, "end", description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (4, '"A. Peri" Music School', 'Diploma in Oboe', 'https://peri-merulo.it/', NULL, '2003-01-09', '2015-03-07', '- Masterclass with Luca Vignali, oboist at Rome Opera House
- Several local events, with the school’s orchestra or chamber groups
- Performances in Rome, Milan and other cities as part of the System of Italian Youth Orchestras', '2023-08-22 17:09:08.512', '2023-08-22 17:09:09.451', '2023-08-22 17:09:09.436', 1, 1, 'en');


--
-- Data for Name: schools_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.skills (id, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (1, 'Python', 'I taught myself Python and it quickly became one of my favourite languages.
I mainly used it to develop an automated assessment tool for CompSci programming assignments, which was the focus of my MSc Dissertation.', '2023-08-22 19:32:13.002', '2023-08-22 19:36:32.358', '2023-08-22 19:32:17.14', 1, 1, 'en', NULL);
INSERT INTO public.skills (id, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (2, 'Java', 'I''ve worked with Java for 7+ years and I implemented various projects for university and personal development, including a Library Manager and a Restaurant Order Management app in JSP. 
Check out my projects [here](/projects).', '2023-08-22 19:37:46.325', '2023-08-22 19:37:47.624', '2023-08-22 19:37:47.617', 1, 1, 'en', 1);


--
-- Data for Name: skills_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: software_development_intros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.software_development_intros (id, title, content, created_at, updated_at, published_at, created_by_id, updated_by_id, vuid, version_number, version_comment, is_visible_in_list_view, locale) VALUES (1, 'Software Development', 'Software development has been both my passion and my work for 8 years. Below is a quick overview of my main technical skill sets and technologies I use. Want to find out more about my experience? Check out my [online CV](/cv) and [project portfolio](/projects).', '2023-08-22 20:02:30.679', '2023-08-22 20:02:40.438', '2023-08-22 20:02:40.423', 1, 1, NULL, 1, NULL, true, 'en');


--
-- Data for Name: software_development_intros_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: software_development_intros_versions_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: strapi_api_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (2, 'plugin_content_manager_configuration_content_types::admin::user', '{"uid":"admin::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (3, 'plugin_content_manager_configuration_content_types::admin::role', '{"uid":"admin::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (4, 'plugin_content_manager_configuration_content_types::plugin::upload.file', '{"uid":"plugin::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (5, 'plugin_content_manager_configuration_content_types::admin::transfer-token', '{"uid":"admin::transfer-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (6, 'plugin_content_manager_configuration_content_types::admin::transfer-token-permission', '{"uid":"admin::transfer-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (7, 'plugin_content_manager_configuration_content_types::plugin::upload.folder', '{"uid":"plugin::upload.folder","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (8, 'plugin_content_manager_configuration_content_types::admin::permission', '{"uid":"admin::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6},{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (9, 'plugin_content_manager_configuration_content_types::admin::api-token-permission', '{"uid":"admin::api-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (10, 'plugin_content_manager_configuration_content_types::admin::api-token', '{"uid":"admin::api-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (11, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.user', '{"uid":"plugin::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (12, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.permission', '{"uid":"plugin::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (15, 'plugin_upload_settings', '{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (16, 'plugin_upload_view_configuration', '{"pageSize":10,"sort":"createdAt:DESC"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (1, 'strapi_content_types_schema', '{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token-permission","connection":"default","uid":"admin::api-token-permission","plugin":"admin","globalId":"AdminApiTokenPermission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token","connection":"default","uid":"admin::transfer-token","plugin":"admin","globalId":"AdminTransferToken"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token-permission","connection":"default","uid":"admin::transfer-token-permission","plugin":"admin","globalId":"AdminTransferTokenPermission"},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"folder","connection":"default","uid":"plugin::upload.folder","plugin":"upload","globalId":"UploadFolder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"},"plugin::menus.menu":{"kind":"collectionType","collectionName":"menus","info":{"displayName":"Menu","singularName":"menu","pluralName":"menus","tableName":"menus"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"title":{"type":"string","required":true},"slug":{"type":"uid","targetField":"title","required":true},"items":{"type":"relation","relation":"oneToMany","target":"plugin::menus.menu-item","mappedBy":"root_menu"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"menus","info":{"displayName":"Menu","singularName":"menu","pluralName":"menus","tableName":"menus"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"title":{"type":"string","required":true},"slug":{"type":"uid","targetField":"title","required":true},"items":{"type":"relation","relation":"oneToMany","target":"plugin::menus.menu-item","mappedBy":"root_menu"}},"kind":"collectionType"},"modelType":"contentType","modelName":"menu","connection":"default","uid":"plugin::menus.menu","plugin":"menus","globalId":"MenusMenu"},"plugin::menus.menu-item":{"kind":"collectionType","collectionName":"menu_items","info":{"displayName":"Menu Item","singularName":"menu-item","pluralName":"menu-items","tableName":"menu_items"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"order":{"type":"integer"},"title":{"type":"string","required":true},"url":{"type":"string"},"target":{"type":"enumeration","enum":["_blank","_parent","_self","_top"]},"root_menu":{"type":"relation","relation":"manyToOne","target":"plugin::menus.menu","inversedBy":"items","required":true},"parent":{"type":"relation","relation":"oneToOne","target":"plugin::menus.menu-item"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"menu_items","info":{"displayName":"Menu Item","singularName":"menu-item","pluralName":"menu-items","tableName":"menu_items"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"order":{"type":"integer"},"title":{"type":"string","required":true},"url":{"type":"string"},"target":{"type":"enumeration","enum":["_blank","_parent","_self","_top"]},"root_menu":{"type":"relation","relation":"manyToOne","target":"plugin::menus.menu","inversedBy":"items","required":true},"parent":{"type":"relation","relation":"oneToOne","target":"plugin::menus.menu-item"}},"kind":"collectionType"},"modelType":"contentType","modelName":"menu-item","connection":"default","uid":"plugin::menus.menu-item","plugin":"menus","globalId":"MenusMenuItem"},"plugin::react-icons.iconlibrary":{"kind":"collectionType","collectionName":"iconlibrary","info":{"singularName":"iconlibrary","pluralName":"iconlibraries","displayName":"IconLibrary"},"options":{"draftAndPublish":false,"comment":""},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"abbreviation":{"type":"string","required":true,"unique":true,"maxLength":3},"isEnabled":{"type":"boolean","default":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"iconlibrary","info":{"singularName":"iconlibrary","pluralName":"iconlibraries","displayName":"IconLibrary"},"options":{"draftAndPublish":false,"comment":""},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"abbreviation":{"type":"string","required":true,"unique":true,"maxLength":3},"isEnabled":{"type":"boolean","default":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"iconlibrary","connection":"default","uid":"plugin::react-icons.iconlibrary","plugin":"react-icons","globalId":"ReactIconsIconlibrary"},"api::book.book":{"kind":"collectionType","collectionName":"books","info":{"singularName":"book","pluralName":"books","displayName":"Book","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"author":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"goodreadsLink":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"genre":{"pluginOptions":{"i18n":{"localized":false}},"type":"enumeration","enum":["Fiction","Non-fiction"]},"rank":{"pluginOptions":{"i18n":{"localized":false}},"type":"integer"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::book.book"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"books","info":{"singularName":"book","pluralName":"books","displayName":"Book","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"author":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"goodreadsLink":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"genre":{"pluginOptions":{"i18n":{"localized":false}},"type":"enumeration","enum":["Fiction","Non-fiction"]},"rank":{"pluginOptions":{"i18n":{"localized":false}},"type":"integer"}},"kind":"collectionType"},"modelType":"contentType","modelName":"book","connection":"default","uid":"api::book.book","apiName":"book","globalId":"Book","actions":{},"lifecycles":{}},"api::code-snippet.code-snippet":{"kind":"collectionType","collectionName":"code_snippets","info":{"singularName":"code-snippet","pluralName":"code-snippets","displayName":"Code Snippet","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"language":{"type":"string"},"code":{"type":"richtext"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"code_snippets","info":{"singularName":"code-snippet","pluralName":"code-snippets","displayName":"Code Snippet","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"language":{"type":"string"},"code":{"type":"richtext"}},"kind":"collectionType"},"modelType":"contentType","modelName":"code-snippet","connection":"default","uid":"api::code-snippet.code-snippet","apiName":"code-snippet","globalId":"CodeSnippet","actions":{},"lifecycles":{}},"api::job.job":{"kind":"collectionType","collectionName":"jobs","info":{"singularName":"job","pluralName":"jobs","displayName":"Job","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"companyName":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"icon":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"location":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"startDate":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"endDate":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"isCurrentJob":{"pluginOptions":{"i18n":{"localized":false}},"type":"boolean"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"mainColor":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","regex":"^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$","customField":"plugin::color-picker.color"},"darkColor":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","regex":"^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$","customField":"plugin::color-picker.color"},"technologies":{"pluginOptions":{"i18n":{"localized":false}},"type":"json"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::job.job"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"jobs","info":{"singularName":"job","pluralName":"jobs","displayName":"Job","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"companyName":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"icon":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"location":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"startDate":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"endDate":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"isCurrentJob":{"pluginOptions":{"i18n":{"localized":false}},"type":"boolean"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"mainColor":{"pluginOptions":{"i18n":{"localized":false}},"type":"customField","regex":"^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$","customField":"plugin::color-picker.color"},"darkColor":{"pluginOptions":{"i18n":{"localized":false}},"type":"customField","regex":"^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$","customField":"plugin::color-picker.color"},"technologies":{"pluginOptions":{"i18n":{"localized":false}},"type":"json"}},"kind":"collectionType"},"modelType":"contentType","modelName":"job","connection":"default","uid":"api::job.job","apiName":"job","globalId":"Job","actions":{},"lifecycles":{}},"api::language.language":{"kind":"collectionType","collectionName":"languages","info":{"singularName":"language","pluralName":"languages","displayName":"Language","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"level":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"flag":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"rank":{"pluginOptions":{"i18n":{"localized":true}},"type":"integer"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::language.language"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"languages","info":{"singularName":"language","pluralName":"languages","displayName":"Language","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"level":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"flag":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"rank":{"pluginOptions":{"i18n":{"localized":true}},"type":"integer"}},"kind":"collectionType"},"modelType":"contentType","modelName":"language","connection":"default","uid":"api::language.language","apiName":"language","globalId":"Language","actions":{},"lifecycles":{}},"api::podcast.podcast":{"kind":"collectionType","collectionName":"podcasts","info":{"singularName":"podcast","pluralName":"podcasts","displayName":"Podcast"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"author":{"type":"string"},"language":{"type":"enumeration","enum":["en","it"]},"cover":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"mediaLink":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"podcasts","info":{"singularName":"podcast","pluralName":"podcasts","displayName":"Podcast"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"author":{"type":"string"},"language":{"type":"enumeration","enum":["en","it"]},"cover":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"mediaLink":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"podcast","connection":"default","uid":"api::podcast.podcast","apiName":"podcast","globalId":"Podcast","actions":{},"lifecycles":{}},"api::publication.publication":{"kind":"collectionType","collectionName":"publications","info":{"singularName":"publication","pluralName":"publications","displayName":"Publication","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","pluginOptions":{"i18n":{"localized":false}}},"description":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"publisher":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"file":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"year":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"rank":{"pluginOptions":{"i18n":{"localized":true}},"type":"integer"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::publication.publication"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"publications","info":{"singularName":"publication","pluralName":"publications","displayName":"Publication","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","pluginOptions":{"i18n":{"localized":false}}},"description":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"publisher":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"file":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"year":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"rank":{"pluginOptions":{"i18n":{"localized":true}},"type":"integer"}},"kind":"collectionType"},"modelType":"contentType","modelName":"publication","connection":"default","uid":"api::publication.publication","apiName":"publication","globalId":"Publication","actions":{},"lifecycles":{}},"api::random-fact.random-fact":{"kind":"collectionType","collectionName":"random_facts","info":{"singularName":"random-fact","pluralName":"random-facts","displayName":"Random Fact","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"headline":{"pluginOptions":{"i18n":{"localized":true}},"type":"text"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"isFactTrue":{"pluginOptions":{"i18n":{"localized":false}},"type":"boolean","default":true},"explanation":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::random-fact.random-fact"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"random_facts","info":{"singularName":"random-fact","pluralName":"random-facts","displayName":"Random Fact","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"headline":{"pluginOptions":{"i18n":{"localized":true}},"type":"text"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"isFactTrue":{"pluginOptions":{"i18n":{"localized":false}},"type":"boolean","default":true},"explanation":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"}},"kind":"collectionType"},"modelType":"contentType","modelName":"random-fact","connection":"default","uid":"api::random-fact.random-fact","apiName":"random-fact","globalId":"RandomFact","actions":{},"lifecycles":{}},"api::school.school":{"kind":"collectionType","collectionName":"schools","info":{"singularName":"school","pluralName":"schools","displayName":"School"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"schoolName":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"flag":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}}},"degreeName":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"degreeUrl":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"grade":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"start":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"end":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"icon":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::school.school"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"schools","info":{"singularName":"school","pluralName":"schools","displayName":"School"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"schoolName":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"flag":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}}},"degreeName":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"degreeUrl":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"grade":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"start":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"end":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"icon":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}}}},"kind":"collectionType"},"modelType":"contentType","modelName":"school","connection":"default","uid":"api::school.school","apiName":"school","globalId":"School","actions":{},"lifecycles":{}},"api::skill.skill":{"kind":"collectionType","collectionName":"skills","info":{"singularName":"skill","pluralName":"skills","displayName":"Skill","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"icons":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"rank":{"pluginOptions":{"i18n":{"localized":false}},"type":"integer"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::skill.skill"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"skills","info":{"singularName":"skill","pluralName":"skills","displayName":"Skill","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"icons":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"rank":{"pluginOptions":{"i18n":{"localized":false}},"type":"integer"}},"kind":"collectionType"},"modelType":"contentType","modelName":"skill","connection":"default","uid":"api::skill.skill","apiName":"skill","globalId":"Skill","actions":{},"lifecycles":{}},"api::software-development-intro.software-development-intro":{"kind":"singleType","collectionName":"software_development_intros","info":{"singularName":"software-development-intro","pluralName":"software-development-intros","displayName":"Software Dev Intro","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"string"},"content":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"icon":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":false}}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"versions":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"manyToMany","target":"api::software-development-intro.software-development-intro"},"vuid":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"versionNumber":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"integer","default":1},"versionComment":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"isVisibleInListView":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"boolean","default":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::software-development-intro.software-development-intro"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"software_development_intros","info":{"singularName":"software-development-intro","pluralName":"software-development-intros","displayName":"Software Dev Intro","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"string"},"content":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"icon":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":false}}}},"kind":"singleType"},"modelType":"contentType","modelName":"software-development-intro","connection":"default","uid":"api::software-development-intro.software-development-intro","apiName":"software-development-intro","globalId":"SoftwareDevelopmentIntro","actions":{},"lifecycles":{}},"api::tv-show.tv-show":{"kind":"collectionType","collectionName":"tv_shows","info":{"singularName":"tv-show","pluralName":"tv-shows","displayName":"TvShow","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"poster":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"link":{"type":"string"},"year":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"tv_shows","info":{"singularName":"tv-show","pluralName":"tv-shows","displayName":"TvShow","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"poster":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"link":{"type":"string"},"year":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"tv-show","connection":"default","uid":"api::tv-show.tv-show","apiName":"tv-show","globalId":"TvShow","actions":{},"lifecycles":{}},"api::video-game.video-game":{"kind":"collectionType","collectionName":"video_games","info":{"singularName":"video-game","pluralName":"video-games","displayName":"VideoGame","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"link":{"type":"string"},"year":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"video_games","info":{"singularName":"video-game","pluralName":"video-games","displayName":"VideoGame","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"link":{"type":"string"},"year":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"video-game","connection":"default","uid":"api::video-game.video-game","apiName":"video-game","globalId":"VideoGame","actions":{},"lifecycles":{}}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (18, 'plugin_users-permissions_grant', '{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"enabled":false,"icon":"","key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (19, 'plugin_users-permissions_email', '{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\n\n<p>But don’t worry! You can use the following link to reset your password:</p>\n<p><%= URL %>?code=<%= TOKEN %></p>\n\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\n\n<p>You have to confirm your email address. Please click on the link below.</p>\n\n<p><%= URL %>?confirmation=<%= CODE %></p>\n\n<p>Thanks.</p>"}}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (20, 'plugin_users-permissions_advanced', '{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (27, 'plugin_documentation_config', '{"restrictedAccess":false}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (13, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.role', '{"uid":"plugin::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (24, 'plugin_content_manager_configuration_content_types::plugin::menus.menu', '{"uid":"plugin::menus.menu","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"items":{"edit":{"label":"items","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"items","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","slug","items"],"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"items","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (22, 'core_admin_auth', '{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (31, 'plugin_drag-drop-content-types_settings', '{"body":{"rank":"rank","title":""}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (14, 'plugin_content_manager_configuration_content_types::plugin::i18n.locale', '{"uid":"plugin::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (21, 'plugin_i18n_default_locale', '"en"', 'string', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (23, 'plugin_content_manager_configuration_content_types::api::job.job', '{"uid":"api::job.job","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"companyName","defaultSortBy":"startDate","defaultSortOrder":"DESC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"companyName":{"edit":{"label":"companyName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"companyName","searchable":true,"sortable":true}},"icon":{"edit":{"label":"icon","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icon","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"location":{"edit":{"label":"location","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"location","searchable":true,"sortable":true}},"startDate":{"edit":{"label":"startDate","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"startDate","searchable":true,"sortable":true}},"endDate":{"edit":{"label":"endDate","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"endDate","searchable":true,"sortable":true}},"isCurrentJob":{"edit":{"label":"isCurrentJob","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isCurrentJob","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":false,"sortable":false}},"mainColor":{"edit":{"label":"mainColor","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mainColor","searchable":true,"sortable":true}},"darkColor":{"edit":{"label":"darkColor","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"darkColor","searchable":true,"sortable":true}},"technologies":{"edit":{"label":"technologies","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"technologies","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"companyName","size":6},{"name":"icon","size":6}],[{"name":"title","size":6},{"name":"location","size":6}],[{"name":"startDate","size":4},{"name":"endDate","size":4},{"name":"isCurrentJob","size":4}],[{"name":"description","size":12}],[{"name":"mainColor","size":6},{"name":"darkColor","size":6}],[{"name":"technologies","size":12}]],"list":["id","companyName","icon","title"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (33, 'plugin_content_manager_configuration_content_types::api::language.language', '{"uid":"api::language.language","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"level":{"edit":{"label":"level","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"level","searchable":true,"sortable":true}},"flag":{"edit":{"label":"flag","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"flag","searchable":false,"sortable":false}},"rank":{"edit":{"label":"rank","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"rank","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","level","flag"],"edit":[[{"name":"name","size":6},{"name":"level","size":6}],[{"name":"flag","size":6},{"name":"rank","size":4}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (42, 'plugin_content_manager_configuration_content_types::api::random-fact.random-fact', '{"uid":"api::random-fact.random-fact","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"name","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"headline":{"edit":{"label":"headline","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"headline","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":false,"sortable":false}},"isFactTrue":{"edit":{"label":"isFactTrue","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isFactTrue","searchable":true,"sortable":true}},"explanation":{"edit":{"label":"explanation","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"explanation","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"name","size":6},{"name":"headline","size":6}],[{"name":"description","size":12}],[{"name":"isFactTrue","size":4}],[{"name":"explanation","size":12}]],"list":["id","name","headline","isFactTrue"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (38, 'plugin_content_manager_configuration_content_types::api::publication.publication', '{"uid":"api::publication.publication","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"publisher":{"edit":{"label":"publisher","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"publisher","searchable":true,"sortable":true}},"file":{"edit":{"label":"file","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"file","searchable":false,"sortable":false}},"year":{"edit":{"label":"year","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"year","searchable":true,"sortable":true}},"rank":{"edit":{"label":"rank","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"rank","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","description","publisher"],"edit":[[{"name":"title","size":6},{"name":"description","size":6}],[{"name":"publisher","size":6}],[{"name":"file","size":6},{"name":"year","size":4}],[{"name":"rank","size":4}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (32, 'plugin_content_manager_configuration_content_types::api::book.book', '{"uid":"api::book.book","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"author":{"edit":{"label":"author","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"author","searchable":true,"sortable":true}},"cover":{"edit":{"label":"cover","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cover","searchable":false,"sortable":false}},"goodreadsLink":{"edit":{"label":"goodreadsLink","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"goodreadsLink","searchable":true,"sortable":true}},"genre":{"edit":{"label":"genre","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"genre","searchable":true,"sortable":true}},"rank":{"edit":{"label":"rank","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"rank","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"title","size":6},{"name":"author","size":6}],[{"name":"cover","size":6},{"name":"goodreadsLink","size":6}],[{"name":"genre","size":6},{"name":"rank","size":4}]],"list":["id","title","author","cover"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (25, 'plugin_content_manager_configuration_content_types::plugin::react-icons.iconlibrary', '{"uid":"plugin::react-icons.iconlibrary","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"abbreviation":{"edit":{"label":"abbreviation","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"abbreviation","searchable":true,"sortable":true}},"isEnabled":{"edit":{"label":"isEnabled","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEnabled","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","abbreviation","isEnabled"],"edit":[[{"name":"name","size":6},{"name":"abbreviation","size":6}],[{"name":"isEnabled","size":4}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (26, 'plugin_content_manager_configuration_content_types::plugin::menus.menu-item', '{"uid":"plugin::menus.menu-item","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"order":{"edit":{"label":"order","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"order","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"target":{"edit":{"label":"target","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"target","searchable":true,"sortable":true}},"root_menu":{"edit":{"label":"root_menu","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"root_menu","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"parent","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","order","title","url"],"edit":[[{"name":"order","size":4},{"name":"title","size":6}],[{"name":"url","size":6},{"name":"target","size":6}],[{"name":"root_menu","size":6},{"name":"parent","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (28, 'plugin_responsive-image_settings', '{"formats":[{"name":"large","width":1000,"fit":"cover","position":"centre","withoutEnlargement":false,"convertToFormat":""},{"name":"medium","width":750,"fit":"cover","position":"centre","withoutEnlargement":false,"convertToFormat":""},{"name":"small","width":500,"fit":"cover","position":"centre","withoutEnlargement":false,"convertToFormat":""}],"quality":87,"progressive":true}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (29, 'plugin_content_manager_configuration_components::shared.meta-social', '{"uid":"shared.meta-social","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"socialNetwork":{"edit":{"label":"socialNetwork","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"socialNetwork","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}}},"layouts":{"list":["id","socialNetwork","title","description"],"edit":[[{"name":"socialNetwork","size":6},{"name":"title","size":6}],[{"name":"description","size":6},{"name":"image","size":6}]]},"isComponent":true}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (30, 'plugin_content_manager_configuration_components::shared.seo', '{"uid":"shared.seo","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"metaTitle","defaultSortBy":"metaTitle","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"metaTitle":{"edit":{"label":"metaTitle","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaTitle","searchable":true,"sortable":true}},"metaDescription":{"edit":{"label":"metaDescription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaDescription","searchable":true,"sortable":true}},"metaImage":{"edit":{"label":"metaImage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaImage","searchable":false,"sortable":false}},"metaSocial":{"edit":{"label":"metaSocial","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaSocial","searchable":false,"sortable":false}},"keywords":{"edit":{"label":"keywords","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"keywords","searchable":true,"sortable":true}},"metaRobots":{"edit":{"label":"metaRobots","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaRobots","searchable":true,"sortable":true}},"structuredData":{"edit":{"label":"structuredData","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"structuredData","searchable":false,"sortable":false}},"metaViewport":{"edit":{"label":"metaViewport","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaViewport","searchable":true,"sortable":true}},"canonicalURL":{"edit":{"label":"canonicalURL","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"canonicalURL","searchable":true,"sortable":true}}},"layouts":{"list":["id","metaTitle","metaDescription","metaImage"],"edit":[[{"name":"metaTitle","size":6},{"name":"metaDescription","size":6}],[{"name":"metaImage","size":6}],[{"name":"metaSocial","size":12}],[{"name":"keywords","size":6},{"name":"metaRobots","size":6}],[{"name":"structuredData","size":12}],[{"name":"metaViewport","size":6},{"name":"canonicalURL","size":6}]]},"isComponent":true}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (41, 'plugin_content_manager_configuration_content_types::api::software-development-intro.software-development-intro', '{"uid":"api::software-development-intro.software-development-intro","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"icon":{"edit":{"label":"icon","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icon","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","icon","createdAt"],"edit":[[{"name":"title","size":6}],[{"name":"content","size":12}],[{"name":"icon","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (17, 'plugin_upload_metrics', '{"weeklySchedule":"28 23 18 * * 0","lastWeeklyUpdate":1692555808031}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (34, 'plugin_content_manager_configuration_content_types::api::podcast.podcast', '{"uid":"api::podcast.podcast","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"author":{"edit":{"label":"author","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"author","searchable":true,"sortable":true}},"language":{"edit":{"label":"language","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"language","searchable":true,"sortable":true}},"cover":{"edit":{"label":"cover","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cover","searchable":false,"sortable":false}},"mediaLink":{"edit":{"label":"mediaLink","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mediaLink","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","author","language"],"edit":[[{"name":"name","size":6},{"name":"author","size":6}],[{"name":"language","size":6},{"name":"cover","size":6}],[{"name":"mediaLink","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (36, 'plugin_content_manager_configuration_content_types::api::school.school', '{"uid":"api::school.school","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"schoolName","defaultSortBy":"start","defaultSortOrder":"DESC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"schoolName":{"edit":{"label":"schoolName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"schoolName","searchable":true,"sortable":true}},"flag":{"edit":{"label":"flag","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"flag","searchable":false,"sortable":false}},"degreeName":{"edit":{"label":"degreeName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"degreeName","searchable":true,"sortable":true}},"degreeUrl":{"edit":{"label":"degreeUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"degreeUrl","searchable":true,"sortable":true}},"grade":{"edit":{"label":"grade","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"grade","searchable":true,"sortable":true}},"start":{"edit":{"label":"start","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"start","searchable":true,"sortable":true}},"end":{"edit":{"label":"end","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"end","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":false,"sortable":false}},"icon":{"edit":{"label":"icon","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icon","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"schoolName","size":6}],[{"name":"degreeName","size":6},{"name":"degreeUrl","size":6}],[{"name":"grade","size":6}],[{"name":"start","size":4},{"name":"end","size":4}],[{"name":"description","size":12}],[{"name":"icon","size":6},{"name":"flag","size":6}]],"list":["id","icon","schoolName","degreeName"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (40, 'plugin_content_manager_configuration_content_types::api::code-snippet.code-snippet', '{"uid":"api::code-snippet.code-snippet","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"language","defaultSortBy":"language","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"language":{"edit":{"label":"language","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"language","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"language","size":6}],[{"name":"code","size":12}]],"list":["id","language","createdAt"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (35, 'plugin_content_manager_configuration_content_types::api::skill.skill', '{"uid":"api::skill.skill","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":false,"sortable":false}},"icons":{"edit":{"label":"icons","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icons","searchable":false,"sortable":false}},"rank":{"edit":{"label":"rank","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"rank","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"title","size":6}],[{"name":"description","size":12}],[{"name":"icons","size":6},{"name":"rank","size":4}]],"list":["id","title","icons","createdAt"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (37, 'plugin_content_manager_configuration_content_types::api::tv-show.tv-show', '{"uid":"api::tv-show.tv-show","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"year","defaultSortOrder":"DESC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"year":{"edit":{"label":"year","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"year","searchable":true,"sortable":true}},"poster":{"edit":{"label":"poster","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"poster","searchable":false,"sortable":false}},"link":{"edit":{"label":"link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"link","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"title","size":6},{"name":"year","size":4}],[{"name":"poster","size":6},{"name":"link","size":6}]],"list":["id","title","year","poster"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (39, 'plugin_content_manager_configuration_content_types::api::video-game.video-game', '{"uid":"api::video-game.video-game","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"title","defaultSortBy":"year","defaultSortOrder":"DESC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"year":{"edit":{"label":"year","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"year","searchable":true,"sortable":true}},"cover":{"edit":{"label":"cover","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cover","searchable":false,"sortable":false}},"link":{"edit":{"label":"link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"link","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"title","size":6},{"name":"year","size":4}],[{"name":"cover","size":6},{"name":"link","size":6}]],"list":["id","cover","title","year"]}}', 'object', NULL, NULL);


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.strapi_database_schema (id, schema, "time", hash) VALUES (19, '{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"menus","indexes":[{"type":"unique","name":"menus_slug_unique","columns":["slug"]},{"name":"menus_created_by_id_fk","columns":["created_by_id"]},{"name":"menus_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"menus_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"menus_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"menu_items","indexes":[{"name":"menu_items_created_by_id_fk","columns":["created_by_id"]},{"name":"menu_items_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"menu_items_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"menu_items_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"target","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"iconlibrary","indexes":[{"name":"iconlibrary_created_by_id_fk","columns":["created_by_id"]},{"name":"iconlibrary_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"iconlibrary_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"iconlibrary_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"abbreviation","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"books","indexes":[{"name":"books_created_by_id_fk","columns":["created_by_id"]},{"name":"books_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"books_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"books_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"author","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"goodreads_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"genre","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"rank","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"code_snippets","indexes":[{"name":"code_snippets_created_by_id_fk","columns":["created_by_id"]},{"name":"code_snippets_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"code_snippets_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"code_snippets_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"jobs","indexes":[{"name":"jobs_created_by_id_fk","columns":["created_by_id"]},{"name":"jobs_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"jobs_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"jobs_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"company_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"location","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"start_date","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"end_date","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_current_job","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"main_color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"dark_color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"technologies","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"languages","indexes":[{"name":"languages_created_by_id_fk","columns":["created_by_id"]},{"name":"languages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"languages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"languages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"level","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"rank","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"podcasts","indexes":[{"name":"podcasts_created_by_id_fk","columns":["created_by_id"]},{"name":"podcasts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"podcasts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"podcasts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"author","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"media_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"publications","indexes":[{"name":"publications_created_by_id_fk","columns":["created_by_id"]},{"name":"publications_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"publications_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"publications_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"publisher","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"year","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"rank","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"random_facts","indexes":[{"name":"random_facts_created_by_id_fk","columns":["created_by_id"]},{"name":"random_facts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"random_facts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"random_facts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headline","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_fact_true","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"explanation","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"schools","indexes":[{"name":"schools_created_by_id_fk","columns":["created_by_id"]},{"name":"schools_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"schools_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"schools_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"school_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"degree_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"degree_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"grade","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"start","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"end","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"skills","indexes":[{"name":"skills_created_by_id_fk","columns":["created_by_id"]},{"name":"skills_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"skills_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"skills_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"rank","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"software_development_intros","indexes":[{"name":"software_development_intros_created_by_id_fk","columns":["created_by_id"]},{"name":"software_development_intros_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"software_development_intros_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"software_development_intros_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"vuid","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"version_number","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"version_comment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_visible_in_list_view","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"tv_shows","indexes":[{"name":"tv_shows_created_by_id_fk","columns":["created_by_id"]},{"name":"tv_shows_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"tv_shows_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"tv_shows_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"year","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"video_games","indexes":[{"name":"video_games_created_by_id_fk","columns":["created_by_id"]},{"name":"video_games_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"video_games_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"video_games_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"year","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_shared_meta_socials","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"social_network","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_shared_seos","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"meta_title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"keywords","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_robots","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"structured_data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_viewport","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"canonical_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"admin_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]},{"name":"admin_users_roles_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_links_order_fk","columns":["role_order"]},{"name":"admin_users_roles_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_links","indexes":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_links_unique","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_links_order_inv_fk","columns":["api_token_permission_order"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_links","indexes":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_links_unique","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_links_order_inv_fk","columns":["transfer_token_permission_order"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]},{"name":"files_related_morphs_order_index","columns":["order"],"type":null},{"name":"files_related_morphs_id_column_index","columns":["related_id"],"type":null}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_links","indexes":[{"name":"files_folder_links_fk","columns":["file_id"]},{"name":"files_folder_links_inv_fk","columns":["folder_id"]},{"name":"files_folder_links_unique","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_links_order_inv_fk","columns":["file_order"]}],"foreignKeys":[{"name":"files_folder_links_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_links_inv_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_links","indexes":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"]},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_links_unique","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_links_order_inv_fk","columns":["folder_order"]}],"foreignKeys":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"up_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]},{"name":"up_users_role_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"menu_items_root_menu_links","indexes":[{"name":"menu_items_root_menu_links_fk","columns":["menu_item_id"]},{"name":"menu_items_root_menu_links_inv_fk","columns":["menu_id"]},{"name":"menu_items_root_menu_links_unique","columns":["menu_item_id","menu_id"],"type":"unique"},{"name":"menu_items_root_menu_links_order_inv_fk","columns":["menu_item_order"]}],"foreignKeys":[{"name":"menu_items_root_menu_links_fk","columns":["menu_item_id"],"referencedColumns":["id"],"referencedTable":"menu_items","onDelete":"CASCADE"},{"name":"menu_items_root_menu_links_inv_fk","columns":["menu_id"],"referencedColumns":["id"],"referencedTable":"menus","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"menu_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"menu_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"menu_item_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"menu_items_parent_links","indexes":[{"name":"menu_items_parent_links_fk","columns":["menu_item_id"]},{"name":"menu_items_parent_links_inv_fk","columns":["inv_menu_item_id"]},{"name":"menu_items_parent_links_unique","columns":["menu_item_id","inv_menu_item_id"],"type":"unique"}],"foreignKeys":[{"name":"menu_items_parent_links_fk","columns":["menu_item_id"],"referencedColumns":["id"],"referencedTable":"menu_items","onDelete":"CASCADE"},{"name":"menu_items_parent_links_inv_fk","columns":["inv_menu_item_id"],"referencedColumns":["id"],"referencedTable":"menu_items","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"menu_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_menu_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"books_localizations_links","indexes":[{"name":"books_localizations_links_fk","columns":["book_id"]},{"name":"books_localizations_links_inv_fk","columns":["inv_book_id"]},{"name":"books_localizations_links_unique","columns":["book_id","inv_book_id"],"type":"unique"},{"name":"books_localizations_links_order_fk","columns":["book_order"]}],"foreignKeys":[{"name":"books_localizations_links_fk","columns":["book_id"],"referencedColumns":["id"],"referencedTable":"books","onDelete":"CASCADE"},{"name":"books_localizations_links_inv_fk","columns":["inv_book_id"],"referencedColumns":["id"],"referencedTable":"books","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"book_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_book_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"book_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"jobs_localizations_links","indexes":[{"name":"jobs_localizations_links_fk","columns":["job_id"]},{"name":"jobs_localizations_links_inv_fk","columns":["inv_job_id"]},{"name":"jobs_localizations_links_unique","columns":["job_id","inv_job_id"],"type":"unique"},{"name":"jobs_localizations_links_order_fk","columns":["job_order"]}],"foreignKeys":[{"name":"jobs_localizations_links_fk","columns":["job_id"],"referencedColumns":["id"],"referencedTable":"jobs","onDelete":"CASCADE"},{"name":"jobs_localizations_links_inv_fk","columns":["inv_job_id"],"referencedColumns":["id"],"referencedTable":"jobs","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"job_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_job_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"job_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"languages_localizations_links","indexes":[{"name":"languages_localizations_links_fk","columns":["language_id"]},{"name":"languages_localizations_links_inv_fk","columns":["inv_language_id"]},{"name":"languages_localizations_links_unique","columns":["language_id","inv_language_id"],"type":"unique"},{"name":"languages_localizations_links_order_fk","columns":["language_order"]}],"foreignKeys":[{"name":"languages_localizations_links_fk","columns":["language_id"],"referencedColumns":["id"],"referencedTable":"languages","onDelete":"CASCADE"},{"name":"languages_localizations_links_inv_fk","columns":["inv_language_id"],"referencedColumns":["id"],"referencedTable":"languages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"language_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_language_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"language_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"publications_localizations_links","indexes":[{"name":"publications_localizations_links_fk","columns":["publication_id"]},{"name":"publications_localizations_links_inv_fk","columns":["inv_publication_id"]},{"name":"publications_localizations_links_unique","columns":["publication_id","inv_publication_id"],"type":"unique"},{"name":"publications_localizations_links_order_fk","columns":["publication_order"]}],"foreignKeys":[{"name":"publications_localizations_links_fk","columns":["publication_id"],"referencedColumns":["id"],"referencedTable":"publications","onDelete":"CASCADE"},{"name":"publications_localizations_links_inv_fk","columns":["inv_publication_id"],"referencedColumns":["id"],"referencedTable":"publications","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"publication_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_publication_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"publication_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"random_facts_localizations_links","indexes":[{"name":"random_facts_localizations_links_fk","columns":["random_fact_id"]},{"name":"random_facts_localizations_links_inv_fk","columns":["inv_random_fact_id"]},{"name":"random_facts_localizations_links_unique","columns":["random_fact_id","inv_random_fact_id"],"type":"unique"},{"name":"random_facts_localizations_links_order_fk","columns":["random_fact_order"]}],"foreignKeys":[{"name":"random_facts_localizations_links_fk","columns":["random_fact_id"],"referencedColumns":["id"],"referencedTable":"random_facts","onDelete":"CASCADE"},{"name":"random_facts_localizations_links_inv_fk","columns":["inv_random_fact_id"],"referencedColumns":["id"],"referencedTable":"random_facts","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"random_fact_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_random_fact_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"random_fact_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"schools_localizations_links","indexes":[{"name":"schools_localizations_links_fk","columns":["school_id"]},{"name":"schools_localizations_links_inv_fk","columns":["inv_school_id"]},{"name":"schools_localizations_links_unique","columns":["school_id","inv_school_id"],"type":"unique"},{"name":"schools_localizations_links_order_fk","columns":["school_order"]}],"foreignKeys":[{"name":"schools_localizations_links_fk","columns":["school_id"],"referencedColumns":["id"],"referencedTable":"schools","onDelete":"CASCADE"},{"name":"schools_localizations_links_inv_fk","columns":["inv_school_id"],"referencedColumns":["id"],"referencedTable":"schools","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"school_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_school_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"school_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"skills_localizations_links","indexes":[{"name":"skills_localizations_links_fk","columns":["skill_id"]},{"name":"skills_localizations_links_inv_fk","columns":["inv_skill_id"]},{"name":"skills_localizations_links_unique","columns":["skill_id","inv_skill_id"],"type":"unique"},{"name":"skills_localizations_links_order_fk","columns":["skill_order"]}],"foreignKeys":[{"name":"skills_localizations_links_fk","columns":["skill_id"],"referencedColumns":["id"],"referencedTable":"skills","onDelete":"CASCADE"},{"name":"skills_localizations_links_inv_fk","columns":["inv_skill_id"],"referencedColumns":["id"],"referencedTable":"skills","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"skill_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_skill_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"skill_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"software_development_intros_versions_links","indexes":[{"name":"software_development_intros_versions_links_fk","columns":["software_development_intro_id"]},{"name":"software_development_intros_versions_links_inv_fk","columns":["inv_software_development_intro_id"]},{"name":"software_development_intros_versions_links_unique","columns":["software_development_intro_id","inv_software_development_intro_id"],"type":"unique"},{"name":"software_development_intros_versions_links_order_fk","columns":["software_development_intro_order"]}],"foreignKeys":[{"name":"software_development_intros_versions_links_fk","columns":["software_development_intro_id"],"referencedColumns":["id"],"referencedTable":"software_development_intros","onDelete":"CASCADE"},{"name":"software_development_intros_versions_links_inv_fk","columns":["inv_software_development_intro_id"],"referencedColumns":["id"],"referencedTable":"software_development_intros","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"software_development_intro_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_software_development_intro_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"software_development_intro_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"software_development_intros_localizations_links","indexes":[{"name":"software_development_intros_localizations_links_fk","columns":["software_development_intro_id"]},{"name":"software_development_intros_localizations_links_inv_fk","columns":["inv_software_development_intro_id"]},{"name":"software_development_intros_localizations_links_unique","columns":["software_development_intro_id","inv_software_development_intro_id"],"type":"unique"},{"name":"software_development_intros_localizations_links_order_fk","columns":["software_development_intro_order"]}],"foreignKeys":[{"name":"software_development_intros_localizations_links_fk","columns":["software_development_intro_id"],"referencedColumns":["id"],"referencedTable":"software_development_intros","onDelete":"CASCADE"},{"name":"software_development_intros_localizations_links_inv_fk","columns":["inv_software_development_intro_id"],"referencedColumns":["id"],"referencedTable":"software_development_intros","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"software_development_intro_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_software_development_intro_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"software_development_intro_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_shared_seos_components","indexes":[{"name":"components_shared_seos_field_index","columns":["field"],"type":null},{"name":"components_shared_seos_component_type_index","columns":["component_type"],"type":null},{"name":"components_shared_seos_entity_fk","columns":["entity_id"]},{"name":"components_shared_seos_unique","columns":["entity_id","component_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_shared_seos_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_shared_seos","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}', '2023-08-23 17:25:47.485', 'b8073611703ee9fc0ed118b848869eb1');


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: strapi_transfer_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tv_shows; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tv_shows (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (1, 'Better Call Saul', '2022', 'https://www.imdb.com/title/tt3032476/?ref_=ext_shr_lnk', '2023-08-23 14:07:19.661', '2023-08-23 14:09:47.969', '2023-08-23 14:09:47.964', NULL, 1);
INSERT INTO public.tv_shows (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (6, 'Black Mirror', '2023', 'https://www.imdb.com/title/tt2085059/?ref_=tt_rvi_tt_i_6', '2023-08-23 14:08:51.495', '2023-08-23 14:10:03.599', '2023-08-23 14:10:03.595', NULL, 1);
INSERT INTO public.tv_shows (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (7, 'Breaking Bad', '2016', 'https://www.imdb.com/title/tt0903747/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_breaki', '2023-08-23 14:09:00.261', '2023-08-23 14:10:22.189', '2023-08-23 14:10:22.183', NULL, 1);
INSERT INTO public.tv_shows (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (4, 'Chernobyl', '2019', 'https://www.imdb.com/title/tt7366338/?ref_=tt_rvi_tt_i_4', '2023-08-23 14:08:34.977', '2023-08-23 14:10:32.163', '2023-08-23 14:10:32.159', NULL, 1);
INSERT INTO public.tv_shows (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (9, 'Doctor Who', '2017', 'https://www.imdb.com/title/tt0436992/?ref_=nv_sr_srsg_0_tt_8_nm_0_q_doctor%2520who', '2023-08-23 14:09:20.531', '2023-08-23 14:10:46.79', '2023-08-23 14:10:46.786', NULL, 1);
INSERT INTO public.tv_shows (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (3, 'Sherlock', '2016', 'https://www.imdb.com/title/tt1475582/?ref_=tt_rvi_tt_i_3', '2023-08-23 14:08:21.072', '2023-08-23 14:10:59.234', '2023-08-23 14:10:59.23', NULL, 1);
INSERT INTO public.tv_shows (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (8, 'Stranger Things', '2022', 'https://www.imdb.com/title/tt4574334/?ref_=nv_sr_srsg_0_tt_7_nm_1_q_stra', '2023-08-23 14:09:12.765', '2023-08-23 14:11:16.837', '2023-08-23 14:11:16.833', NULL, 1);
INSERT INTO public.tv_shows (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (2, 'Unorthodox', '2020', 'https://www.imdb.com/title/tt9815454/?ref_=tt_rvi_tt_i_2', '2023-08-23 14:07:34.417', '2023-08-23 14:11:36.993', '2023-08-23 14:11:36.99', NULL, 1);
INSERT INTO public.tv_shows (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (5, 'Westworld', '2019', 'https://www.imdb.com/title/tt0475784/?ref_=tt_rvi_tt_i_5', '2023-08-23 14:08:42.167', '2023-08-23 14:11:50.158', '2023-08-23 14:11:50.154', NULL, 1);
INSERT INTO public.tv_shows (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (10, 'The Last of Us', '2023', 'https://www.imdb.com/title/tt3581920/?ref_=fn_al_tt_1', '2023-08-24 14:46:10.784', '2023-08-24 14:46:12.765', '2023-08-24 14:46:12.759', 1, 1);
INSERT INTO public.tv_shows (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (11, 'The Umbrella Academy', '2019', 'https://www.imdb.com/title/tt1312171', '2023-08-24 14:50:20.253', '2023-08-24 14:50:21.858', '2023-08-24 14:50:21.853', 1, 1);


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (1, 'plugin::users-permissions.user.me', '2023-08-13 18:13:24.207', '2023-08-13 18:13:24.207', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (2, 'plugin::users-permissions.auth.changePassword', '2023-08-13 18:13:24.207', '2023-08-13 18:13:24.207', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (3, 'plugin::users-permissions.auth.callback', '2023-08-13 18:13:24.227', '2023-08-13 18:13:24.227', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (4, 'plugin::users-permissions.auth.connect', '2023-08-13 18:13:24.227', '2023-08-13 18:13:24.227', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (6, 'plugin::users-permissions.auth.resetPassword', '2023-08-13 18:13:24.227', '2023-08-13 18:13:24.227', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (5, 'plugin::users-permissions.auth.forgotPassword', '2023-08-13 18:13:24.227', '2023-08-13 18:13:24.227', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (7, 'plugin::users-permissions.auth.register', '2023-08-13 18:13:24.227', '2023-08-13 18:13:24.227', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (8, 'plugin::users-permissions.auth.emailConfirmation', '2023-08-13 18:13:24.227', '2023-08-13 18:13:24.227', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (9, 'plugin::users-permissions.auth.sendEmailConfirmation', '2023-08-13 18:13:24.227', '2023-08-13 18:13:24.227', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (10, 'api::job.job.find', '2023-08-15 18:19:24.254', '2023-08-15 18:19:24.254', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (11, 'api::job.job.findOne', '2023-08-15 18:19:24.254', '2023-08-15 18:19:24.254', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (12, 'api::book.book.find', '2023-08-22 15:15:16.794', '2023-08-22 15:15:16.794', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (13, 'api::book.book.findOne', '2023-08-22 15:15:16.794', '2023-08-22 15:15:16.794', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (14, 'api::language.language.find', '2023-08-22 15:15:31.384', '2023-08-22 15:15:31.384', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (15, 'api::language.language.findOne', '2023-08-22 15:15:31.384', '2023-08-22 15:15:31.384', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (16, 'api::podcast.podcast.find', '2023-08-22 15:15:31.384', '2023-08-22 15:15:31.384', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (17, 'api::podcast.podcast.findOne', '2023-08-22 15:15:31.384', '2023-08-22 15:15:31.384', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (18, 'api::publication.publication.find', '2023-08-22 15:15:55.188', '2023-08-22 15:15:55.188', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (19, 'api::school.school.find', '2023-08-22 15:15:55.188', '2023-08-22 15:15:55.188', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (20, 'api::publication.publication.findOne', '2023-08-22 15:15:55.188', '2023-08-22 15:15:55.188', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (21, 'api::school.school.findOne', '2023-08-22 15:15:55.188', '2023-08-22 15:15:55.188', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (22, 'api::skill.skill.find', '2023-08-22 15:15:55.188', '2023-08-22 15:15:55.188', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (23, 'api::skill.skill.findOne', '2023-08-22 15:15:55.188', '2023-08-22 15:15:55.188', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (24, 'api::video-game.video-game.find', '2023-08-22 15:15:55.188', '2023-08-22 15:15:55.188', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (25, 'api::tv-show.tv-show.find', '2023-08-22 15:15:55.188', '2023-08-22 15:15:55.188', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (26, 'api::tv-show.tv-show.findOne', '2023-08-22 15:15:55.188', '2023-08-22 15:15:55.188', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (27, 'api::video-game.video-game.findOne', '2023-08-22 15:15:55.188', '2023-08-22 15:15:55.188', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (28, 'api::code-snippet.code-snippet.find', '2023-08-22 20:00:21.322', '2023-08-22 20:00:21.322', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (29, 'api::code-snippet.code-snippet.findOne', '2023-08-22 20:00:21.322', '2023-08-22 20:00:21.322', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (30, 'api::software-development-intro.software-development-intro.find', '2023-08-22 20:00:21.322', '2023-08-22 20:00:21.322', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (31, 'api::random-fact.random-fact.find', '2023-08-23 17:42:06.978', '2023-08-23 17:42:06.978', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (32, 'api::random-fact.random-fact.findOne', '2023-08-23 17:42:06.978', '2023-08-23 17:42:06.978', NULL, NULL);


--
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (1, 1, 1, 1);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (2, 2, 1, 1);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (3, 3, 2, 1);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (4, 4, 2, 1);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (5, 8, 2, 1);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (6, 7, 2, 1);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (7, 6, 2, 1);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (8, 5, 2, 2);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (9, 9, 2, 2);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (10, 10, 2, 3);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (11, 11, 2, 3);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (12, 12, 2, 4);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (13, 13, 2, 4);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (14, 16, 2, 5);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (15, 15, 2, 5);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (16, 14, 2, 5);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (17, 17, 2, 5);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (18, 21, 2, 6);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (19, 18, 2, 6);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (20, 19, 2, 6);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (21, 20, 2, 6);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (22, 22, 2, 6);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (23, 24, 2, 6);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (24, 25, 2, 6);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (25, 23, 2, 7);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (26, 27, 2, 7);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (27, 26, 2, 7);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (28, 28, 2, 8);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (29, 30, 2, 8);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (30, 29, 2, 8);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (31, 31, 2, 9);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (32, 32, 2, 9);


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) VALUES (1, 'Authenticated', 'Default role given to authenticated user.', 'authenticated', '2023-08-13 18:13:24.188', '2023-08-13 18:13:24.188', NULL, NULL);
INSERT INTO public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) VALUES (2, 'Public', 'Default role given to unauthenticated user.', 'public', '2023-08-13 18:13:24.195', '2023-08-23 17:42:06.971', NULL, NULL);


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) VALUES (1, 'Books', 1, '/1', '2023-08-23 13:48:11.443', '2023-08-23 13:48:11.443', 1, 1);
INSERT INTO public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) VALUES (2, 'Podcasts', 2, '/2', '2023-08-23 13:49:33.088', '2023-08-23 13:49:33.088', 1, 1);
INSERT INTO public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) VALUES (3, 'TvShows', 3, '/3', '2023-08-23 13:50:02.48', '2023-08-23 13:50:02.48', 1, 1);
INSERT INTO public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) VALUES (4, 'VideoGames', 4, '/4', '2023-08-23 16:20:15.217', '2023-08-23 16:20:15.217', 1, 1);
INSERT INTO public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) VALUES (5, 'Icons', 5, '/5', '2023-08-24 16:22:45.339', '2023-08-24 16:22:45.339', 1, 1);


--
-- Data for Name: upload_folders_parent_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: video_games; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (2, 'Rayman Legends', '2013', 'https://www.igdb.com/games/rayman-legends--1', '2023-08-23 16:19:24.096', '2023-08-23 16:23:16.005', '2023-08-23 16:23:15.999', NULL, 1);
INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (3, 'Portal 2', '2011', 'https://www.igdb.com/games/portal-2', '2023-08-23 16:19:24.105', '2023-08-23 16:23:57.611', '2023-08-23 16:23:57.607', NULL, 1);
INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (9, 'Guitar Hero: Warriors of Rock', '2010', 'https://www.igdb.com/games/guitar-hero-warriors-of-rock', '2023-08-23 16:19:24.154', '2023-08-23 16:24:17.241', '2023-08-23 16:24:17.236', NULL, 1);
INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (5, 'Professor Layton and the Unwound Future', '2008', 'https://www.igdb.com/games/professor-layton-and-the-unwound-future', '2023-08-23 16:19:24.122', '2023-08-23 16:24:40.18', '2023-08-23 16:24:40.176', NULL, 1);
INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (11, 'Sonic Unleashed', '2008', 'https://www.igdb.com/games/sonic-unleashed--1', '2023-08-23 16:19:24.17', '2023-08-23 16:24:58.392', '2023-08-23 16:24:58.386', NULL, 1);
INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (7, 'Croc 2', '1999', 'https://www.igdb.com/games/croc-2', '2023-08-23 16:19:24.138', '2023-08-23 16:25:23.408', '2023-08-23 16:25:23.404', NULL, 1);
INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (14, 'The Legend of Zelda: Tears of the Kingdom', '2023', 'https://www.igdb.com/games/the-legend-of-zelda-tears-of-the-kingdom', '2023-08-23 16:19:24.197', '2023-08-23 16:20:54.299', '2023-08-23 16:20:54.294', NULL, 1);
INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (12, 'Sonic Frontiers', '2022', 'https://www.igdb.com/games/sonic-frontiers', '2023-08-23 16:19:24.18', '2023-08-23 16:21:15.128', '2023-08-23 16:21:15.122', NULL, 1);
INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (16, 'Pokémon Go', '2021', 'https://www.igdb.com/games/pokemon-go', '2023-08-23 16:19:24.213', '2023-08-23 16:21:30.178', '2023-08-23 16:21:30.172', NULL, 1);
INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (1, 'Detroit Become Human', '2018', 'https://www.igdb.com/games/detroit-become-human--1', '2023-08-23 16:19:24.084', '2023-08-23 16:22:01.056', '2023-08-23 16:22:01.051', NULL, 1);
INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (4, 'The Legend of Zelda: Breath of the Wild', '2017', 'https://www.igdb.com/games/the-legend-of-zelda-breath-of-the-wild', '2023-08-23 16:19:24.113', '2023-08-23 16:22:14.335', '2023-08-23 16:22:14.331', NULL, 1);
INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (13, 'Super Mario Odyssey', '2017', 'https://www.igdb.com/games/super-mario-odyssey', '2023-08-23 16:19:24.188', '2023-08-23 16:22:27.231', '2023-08-23 16:22:27.226', NULL, 1);
INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (8, 'Uncharted 4', '2016', 'https://www.igdb.com/games/uncharted-4-a-thief-s-end', '2023-08-23 16:19:24.147', '2023-08-23 16:22:37.495', '2023-08-23 16:22:37.49', NULL, 1);
INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (6, 'Ori and the Blind Forest', '2015', 'https://www.igdb.com/games/ori-and-the-blind-forest', '2023-08-23 16:19:24.13', '2023-08-23 16:22:47.93', '2023-08-23 16:22:47.926', NULL, 1);
INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (10, 'Rocket League', '2015', 'https://www.igdb.com/games/rocket-league', '2023-08-23 16:19:24.162', '2023-08-23 16:22:59.595', '2023-08-23 16:22:59.591', NULL, 1);
INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (15, 'Ori and the Will of the Wisps', '2020', 'https://www.igdb.com/games/ori-and-the-will-of-the-wisps', '2023-08-23 16:19:24.205', '2023-08-24 14:54:52.189', '2023-08-24 14:54:52.183', NULL, 1);


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 173, true);


--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 183, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_roles_links_id_seq', 1, true);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_id_seq', 9, true);


--
-- Name: books_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_localizations_links_id_seq', 1, false);


--
-- Name: code_snippets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.code_snippets_id_seq', 15, true);


--
-- Name: components_shared_meta_socials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_shared_meta_socials_id_seq', 1, false);


--
-- Name: components_shared_seos_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_shared_seos_components_id_seq', 1, false);


--
-- Name: components_shared_seos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_shared_seos_id_seq', 1, false);


--
-- Name: files_folder_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_folder_links_id_seq', 63, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 83, true);


--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 94, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 3, true);


--
-- Name: iconlibrary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iconlibrary_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 6, true);


--
-- Name: jobs_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_localizations_links_id_seq', 2, true);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_id_seq', 4, true);


--
-- Name: languages_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_localizations_links_id_seq', 1, false);


--
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_items_id_seq', 1, false);


--
-- Name: menu_items_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_items_parent_links_id_seq', 1, false);


--
-- Name: menu_items_root_menu_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_items_root_menu_links_id_seq', 1, false);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menus_id_seq', 1, false);


--
-- Name: podcasts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.podcasts_id_seq', 9, true);


--
-- Name: publications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publications_id_seq', 4, true);


--
-- Name: publications_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publications_localizations_links_id_seq', 1, false);


--
-- Name: random_facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.random_facts_id_seq', 11, true);


--
-- Name: random_facts_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.random_facts_localizations_links_id_seq', 1, false);


--
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schools_id_seq', 4, true);


--
-- Name: schools_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schools_localizations_links_id_seq', 1, false);


--
-- Name: skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skills_id_seq', 2, true);


--
-- Name: skills_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skills_localizations_links_id_seq', 1, false);


--
-- Name: software_development_intros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.software_development_intros_id_seq', 1, true);


--
-- Name: software_development_intros_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.software_development_intros_localizations_links_id_seq', 1, false);


--
-- Name: software_development_intros_versions_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.software_development_intros_versions_links_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, false);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 42, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 19, true);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: tv_shows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tv_shows_id_seq', 11, true);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 32, true);


--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 32, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_id_seq', 1, false);


--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_role_links_id_seq', 1, false);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 5, true);


--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);


--
-- Name: video_games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.video_games_id_seq', 17, false);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_unique UNIQUE (user_id, role_id);


--
-- Name: books_localizations_links books_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_localizations_links
    ADD CONSTRAINT books_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: books_localizations_links books_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_localizations_links
    ADD CONSTRAINT books_localizations_links_unique UNIQUE (book_id, inv_book_id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: code_snippets code_snippets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.code_snippets
    ADD CONSTRAINT code_snippets_pkey PRIMARY KEY (id);


--
-- Name: components_shared_meta_socials components_shared_meta_socials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_meta_socials
    ADD CONSTRAINT components_shared_meta_socials_pkey PRIMARY KEY (id);


--
-- Name: components_shared_seos_components components_shared_seos_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_seos_components
    ADD CONSTRAINT components_shared_seos_components_pkey PRIMARY KEY (id);


--
-- Name: components_shared_seos components_shared_seos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_seos
    ADD CONSTRAINT components_shared_seos_pkey PRIMARY KEY (id);


--
-- Name: components_shared_seos_components components_shared_seos_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_seos_components
    ADD CONSTRAINT components_shared_seos_unique UNIQUE (entity_id, component_id, field, component_type);


--
-- Name: files_folder_links files_folder_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_pkey PRIMARY KEY (id);


--
-- Name: files_folder_links files_folder_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_unique UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_morphs files_related_morphs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: iconlibrary iconlibrary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iconlibrary
    ADD CONSTRAINT iconlibrary_pkey PRIMARY KEY (id);


--
-- Name: jobs_localizations_links jobs_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs_localizations_links
    ADD CONSTRAINT jobs_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: jobs_localizations_links jobs_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs_localizations_links
    ADD CONSTRAINT jobs_localizations_links_unique UNIQUE (job_id, inv_job_id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: languages_localizations_links languages_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages_localizations_links
    ADD CONSTRAINT languages_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: languages_localizations_links languages_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages_localizations_links
    ADD CONSTRAINT languages_localizations_links_unique UNIQUE (language_id, inv_language_id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: menu_items_parent_links menu_items_parent_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_parent_links
    ADD CONSTRAINT menu_items_parent_links_pkey PRIMARY KEY (id);


--
-- Name: menu_items_parent_links menu_items_parent_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_parent_links
    ADD CONSTRAINT menu_items_parent_links_unique UNIQUE (menu_item_id, inv_menu_item_id);


--
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- Name: menu_items_root_menu_links menu_items_root_menu_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_root_menu_links
    ADD CONSTRAINT menu_items_root_menu_links_pkey PRIMARY KEY (id);


--
-- Name: menu_items_root_menu_links menu_items_root_menu_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_root_menu_links
    ADD CONSTRAINT menu_items_root_menu_links_unique UNIQUE (menu_item_id, menu_id);


--
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: menus menus_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_slug_unique UNIQUE (slug);


--
-- Name: podcasts podcasts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.podcasts
    ADD CONSTRAINT podcasts_pkey PRIMARY KEY (id);


--
-- Name: publications_localizations_links publications_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publications_localizations_links
    ADD CONSTRAINT publications_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: publications_localizations_links publications_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publications_localizations_links
    ADD CONSTRAINT publications_localizations_links_unique UNIQUE (publication_id, inv_publication_id);


--
-- Name: publications publications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_pkey PRIMARY KEY (id);


--
-- Name: random_facts_localizations_links random_facts_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.random_facts_localizations_links
    ADD CONSTRAINT random_facts_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: random_facts_localizations_links random_facts_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.random_facts_localizations_links
    ADD CONSTRAINT random_facts_localizations_links_unique UNIQUE (random_fact_id, inv_random_fact_id);


--
-- Name: random_facts random_facts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.random_facts
    ADD CONSTRAINT random_facts_pkey PRIMARY KEY (id);


--
-- Name: schools_localizations_links schools_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools_localizations_links
    ADD CONSTRAINT schools_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: schools_localizations_links schools_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools_localizations_links
    ADD CONSTRAINT schools_localizations_links_unique UNIQUE (school_id, inv_school_id);


--
-- Name: schools schools_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT schools_pkey PRIMARY KEY (id);


--
-- Name: skills_localizations_links skills_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills_localizations_links
    ADD CONSTRAINT skills_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: skills_localizations_links skills_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills_localizations_links
    ADD CONSTRAINT skills_localizations_links_unique UNIQUE (skill_id, inv_skill_id);


--
-- Name: skills skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- Name: software_development_intros_localizations_links software_development_intros_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.software_development_intros_localizations_links
    ADD CONSTRAINT software_development_intros_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: software_development_intros_localizations_links software_development_intros_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.software_development_intros_localizations_links
    ADD CONSTRAINT software_development_intros_localizations_links_unique UNIQUE (software_development_intro_id, inv_software_development_intro_id);


--
-- Name: software_development_intros software_development_intros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.software_development_intros
    ADD CONSTRAINT software_development_intros_pkey PRIMARY KEY (id);


--
-- Name: software_development_intros_versions_links software_development_intros_versions_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.software_development_intros_versions_links
    ADD CONSTRAINT software_development_intros_versions_links_pkey PRIMARY KEY (id);


--
-- Name: software_development_intros_versions_links software_development_intros_versions_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.software_development_intros_versions_links
    ADD CONSTRAINT software_development_intros_versions_links_unique UNIQUE (software_development_intro_id, inv_software_development_intro_id);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_unique UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_unique UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: tv_shows tv_shows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tv_shows
    ADD CONSTRAINT tv_shows_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_unique UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_unique UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: video_games video_games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_games
    ADD CONSTRAINT video_games_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);


--
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);


--
-- Name: admin_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_order_inv_fk ON public.admin_permissions_role_links USING btree (permission_order);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);


--
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);


--
-- Name: admin_users_roles_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_order_fk ON public.admin_users_roles_links USING btree (role_order);


--
-- Name: admin_users_roles_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_order_inv_fk ON public.admin_users_roles_links USING btree (user_order);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: books_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX books_created_by_id_fk ON public.books USING btree (created_by_id);


--
-- Name: books_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX books_localizations_links_fk ON public.books_localizations_links USING btree (book_id);


--
-- Name: books_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX books_localizations_links_inv_fk ON public.books_localizations_links USING btree (inv_book_id);


--
-- Name: books_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX books_localizations_links_order_fk ON public.books_localizations_links USING btree (book_order);


--
-- Name: books_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX books_updated_by_id_fk ON public.books USING btree (updated_by_id);


--
-- Name: code_snippets_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX code_snippets_created_by_id_fk ON public.code_snippets USING btree (created_by_id);


--
-- Name: code_snippets_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX code_snippets_updated_by_id_fk ON public.code_snippets USING btree (updated_by_id);


--
-- Name: components_shared_seos_component_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_shared_seos_component_type_index ON public.components_shared_seos_components USING btree (component_type);


--
-- Name: components_shared_seos_entity_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_shared_seos_entity_fk ON public.components_shared_seos_components USING btree (entity_id);


--
-- Name: components_shared_seos_field_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_shared_seos_field_index ON public.components_shared_seos_components USING btree (field);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_folder_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_fk ON public.files_folder_links USING btree (file_id);


--
-- Name: files_folder_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_inv_fk ON public.files_folder_links USING btree (folder_id);


--
-- Name: files_folder_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_order_inv_fk ON public.files_folder_links USING btree (file_order);


--
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);


--
-- Name: files_related_morphs_id_column_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_id_column_index ON public.files_related_morphs USING btree (related_id);


--
-- Name: files_related_morphs_order_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_order_index ON public.files_related_morphs USING btree ("order");


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: iconlibrary_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iconlibrary_created_by_id_fk ON public.iconlibrary USING btree (created_by_id);


--
-- Name: iconlibrary_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iconlibrary_updated_by_id_fk ON public.iconlibrary USING btree (updated_by_id);


--
-- Name: jobs_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_created_by_id_fk ON public.jobs USING btree (created_by_id);


--
-- Name: jobs_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_localizations_links_fk ON public.jobs_localizations_links USING btree (job_id);


--
-- Name: jobs_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_localizations_links_inv_fk ON public.jobs_localizations_links USING btree (inv_job_id);


--
-- Name: jobs_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_localizations_links_order_fk ON public.jobs_localizations_links USING btree (job_order);


--
-- Name: jobs_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_updated_by_id_fk ON public.jobs USING btree (updated_by_id);


--
-- Name: languages_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX languages_created_by_id_fk ON public.languages USING btree (created_by_id);


--
-- Name: languages_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX languages_localizations_links_fk ON public.languages_localizations_links USING btree (language_id);


--
-- Name: languages_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX languages_localizations_links_inv_fk ON public.languages_localizations_links USING btree (inv_language_id);


--
-- Name: languages_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX languages_localizations_links_order_fk ON public.languages_localizations_links USING btree (language_order);


--
-- Name: languages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX languages_updated_by_id_fk ON public.languages USING btree (updated_by_id);


--
-- Name: menu_items_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menu_items_created_by_id_fk ON public.menu_items USING btree (created_by_id);


--
-- Name: menu_items_parent_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menu_items_parent_links_fk ON public.menu_items_parent_links USING btree (menu_item_id);


--
-- Name: menu_items_parent_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menu_items_parent_links_inv_fk ON public.menu_items_parent_links USING btree (inv_menu_item_id);


--
-- Name: menu_items_root_menu_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menu_items_root_menu_links_fk ON public.menu_items_root_menu_links USING btree (menu_item_id);


--
-- Name: menu_items_root_menu_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menu_items_root_menu_links_inv_fk ON public.menu_items_root_menu_links USING btree (menu_id);


--
-- Name: menu_items_root_menu_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menu_items_root_menu_links_order_inv_fk ON public.menu_items_root_menu_links USING btree (menu_item_order);


--
-- Name: menu_items_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menu_items_updated_by_id_fk ON public.menu_items USING btree (updated_by_id);


--
-- Name: menus_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menus_created_by_id_fk ON public.menus USING btree (created_by_id);


--
-- Name: menus_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menus_updated_by_id_fk ON public.menus USING btree (updated_by_id);


--
-- Name: podcasts_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX podcasts_created_by_id_fk ON public.podcasts USING btree (created_by_id);


--
-- Name: podcasts_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX podcasts_updated_by_id_fk ON public.podcasts USING btree (updated_by_id);


--
-- Name: publications_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX publications_created_by_id_fk ON public.publications USING btree (created_by_id);


--
-- Name: publications_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX publications_localizations_links_fk ON public.publications_localizations_links USING btree (publication_id);


--
-- Name: publications_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX publications_localizations_links_inv_fk ON public.publications_localizations_links USING btree (inv_publication_id);


--
-- Name: publications_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX publications_localizations_links_order_fk ON public.publications_localizations_links USING btree (publication_order);


--
-- Name: publications_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX publications_updated_by_id_fk ON public.publications USING btree (updated_by_id);


--
-- Name: random_facts_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX random_facts_created_by_id_fk ON public.random_facts USING btree (created_by_id);


--
-- Name: random_facts_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX random_facts_localizations_links_fk ON public.random_facts_localizations_links USING btree (random_fact_id);


--
-- Name: random_facts_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX random_facts_localizations_links_inv_fk ON public.random_facts_localizations_links USING btree (inv_random_fact_id);


--
-- Name: random_facts_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX random_facts_localizations_links_order_fk ON public.random_facts_localizations_links USING btree (random_fact_order);


--
-- Name: random_facts_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX random_facts_updated_by_id_fk ON public.random_facts USING btree (updated_by_id);


--
-- Name: schools_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX schools_created_by_id_fk ON public.schools USING btree (created_by_id);


--
-- Name: schools_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX schools_localizations_links_fk ON public.schools_localizations_links USING btree (school_id);


--
-- Name: schools_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX schools_localizations_links_inv_fk ON public.schools_localizations_links USING btree (inv_school_id);


--
-- Name: schools_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX schools_localizations_links_order_fk ON public.schools_localizations_links USING btree (school_order);


--
-- Name: schools_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX schools_updated_by_id_fk ON public.schools USING btree (updated_by_id);


--
-- Name: skills_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX skills_created_by_id_fk ON public.skills USING btree (created_by_id);


--
-- Name: skills_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX skills_localizations_links_fk ON public.skills_localizations_links USING btree (skill_id);


--
-- Name: skills_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX skills_localizations_links_inv_fk ON public.skills_localizations_links USING btree (inv_skill_id);


--
-- Name: skills_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX skills_localizations_links_order_fk ON public.skills_localizations_links USING btree (skill_order);


--
-- Name: skills_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX skills_updated_by_id_fk ON public.skills USING btree (updated_by_id);


--
-- Name: software_development_intros_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX software_development_intros_created_by_id_fk ON public.software_development_intros USING btree (created_by_id);


--
-- Name: software_development_intros_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX software_development_intros_localizations_links_fk ON public.software_development_intros_localizations_links USING btree (software_development_intro_id);


--
-- Name: software_development_intros_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX software_development_intros_localizations_links_inv_fk ON public.software_development_intros_localizations_links USING btree (inv_software_development_intro_id);


--
-- Name: software_development_intros_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX software_development_intros_localizations_links_order_fk ON public.software_development_intros_localizations_links USING btree (software_development_intro_order);


--
-- Name: software_development_intros_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX software_development_intros_updated_by_id_fk ON public.software_development_intros USING btree (updated_by_id);


--
-- Name: software_development_intros_versions_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX software_development_intros_versions_links_fk ON public.software_development_intros_versions_links USING btree (software_development_intro_id);


--
-- Name: software_development_intros_versions_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX software_development_intros_versions_links_inv_fk ON public.software_development_intros_versions_links USING btree (inv_software_development_intro_id);


--
-- Name: software_development_intros_versions_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX software_development_intros_versions_links_order_fk ON public.software_development_intros_versions_links USING btree (software_development_intro_order);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_order_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_order);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_links_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_links_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_links_order_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_order);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: tv_shows_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tv_shows_created_by_id_fk ON public.tv_shows USING btree (created_by_id);


--
-- Name: tv_shows_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tv_shows_updated_by_id_fk ON public.tv_shows USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);


--
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);


--
-- Name: up_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_order_inv_fk ON public.up_permissions_role_links USING btree (permission_order);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);


--
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);


--
-- Name: up_users_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_order_inv_fk ON public.up_users_role_links USING btree (user_order);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_parent_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_fk ON public.upload_folders_parent_links USING btree (folder_id);


--
-- Name: upload_folders_parent_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_inv_fk ON public.upload_folders_parent_links USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_order_inv_fk ON public.upload_folders_parent_links USING btree (folder_order);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: video_games_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX video_games_created_by_id_fk ON public.video_games USING btree (created_by_id);


--
-- Name: video_games_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX video_games_updated_by_id_fk ON public.video_games USING btree (updated_by_id);


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: books books_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: books_localizations_links books_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_localizations_links
    ADD CONSTRAINT books_localizations_links_fk FOREIGN KEY (book_id) REFERENCES public.books(id) ON DELETE CASCADE;


--
-- Name: books_localizations_links books_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_localizations_links
    ADD CONSTRAINT books_localizations_links_inv_fk FOREIGN KEY (inv_book_id) REFERENCES public.books(id) ON DELETE CASCADE;


--
-- Name: books books_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: code_snippets code_snippets_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.code_snippets
    ADD CONSTRAINT code_snippets_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: code_snippets code_snippets_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.code_snippets
    ADD CONSTRAINT code_snippets_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: components_shared_seos_components components_shared_seos_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_seos_components
    ADD CONSTRAINT components_shared_seos_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_shared_seos(id) ON DELETE CASCADE;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_links files_folder_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_links files_folder_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_inv_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: iconlibrary iconlibrary_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iconlibrary
    ADD CONSTRAINT iconlibrary_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: iconlibrary iconlibrary_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iconlibrary
    ADD CONSTRAINT iconlibrary_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: jobs jobs_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: jobs_localizations_links jobs_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs_localizations_links
    ADD CONSTRAINT jobs_localizations_links_fk FOREIGN KEY (job_id) REFERENCES public.jobs(id) ON DELETE CASCADE;


--
-- Name: jobs_localizations_links jobs_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs_localizations_links
    ADD CONSTRAINT jobs_localizations_links_inv_fk FOREIGN KEY (inv_job_id) REFERENCES public.jobs(id) ON DELETE CASCADE;


--
-- Name: jobs jobs_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: languages languages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: languages_localizations_links languages_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages_localizations_links
    ADD CONSTRAINT languages_localizations_links_fk FOREIGN KEY (language_id) REFERENCES public.languages(id) ON DELETE CASCADE;


--
-- Name: languages_localizations_links languages_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages_localizations_links
    ADD CONSTRAINT languages_localizations_links_inv_fk FOREIGN KEY (inv_language_id) REFERENCES public.languages(id) ON DELETE CASCADE;


--
-- Name: languages languages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: menu_items menu_items_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: menu_items_parent_links menu_items_parent_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_parent_links
    ADD CONSTRAINT menu_items_parent_links_fk FOREIGN KEY (menu_item_id) REFERENCES public.menu_items(id) ON DELETE CASCADE;


--
-- Name: menu_items_parent_links menu_items_parent_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_parent_links
    ADD CONSTRAINT menu_items_parent_links_inv_fk FOREIGN KEY (inv_menu_item_id) REFERENCES public.menu_items(id) ON DELETE CASCADE;


--
-- Name: menu_items_root_menu_links menu_items_root_menu_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_root_menu_links
    ADD CONSTRAINT menu_items_root_menu_links_fk FOREIGN KEY (menu_item_id) REFERENCES public.menu_items(id) ON DELETE CASCADE;


--
-- Name: menu_items_root_menu_links menu_items_root_menu_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_root_menu_links
    ADD CONSTRAINT menu_items_root_menu_links_inv_fk FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: menu_items menu_items_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: menus menus_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: menus menus_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: podcasts podcasts_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.podcasts
    ADD CONSTRAINT podcasts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: podcasts podcasts_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.podcasts
    ADD CONSTRAINT podcasts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: publications publications_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: publications_localizations_links publications_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publications_localizations_links
    ADD CONSTRAINT publications_localizations_links_fk FOREIGN KEY (publication_id) REFERENCES public.publications(id) ON DELETE CASCADE;


--
-- Name: publications_localizations_links publications_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publications_localizations_links
    ADD CONSTRAINT publications_localizations_links_inv_fk FOREIGN KEY (inv_publication_id) REFERENCES public.publications(id) ON DELETE CASCADE;


--
-- Name: publications publications_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: random_facts random_facts_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.random_facts
    ADD CONSTRAINT random_facts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: random_facts_localizations_links random_facts_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.random_facts_localizations_links
    ADD CONSTRAINT random_facts_localizations_links_fk FOREIGN KEY (random_fact_id) REFERENCES public.random_facts(id) ON DELETE CASCADE;


--
-- Name: random_facts_localizations_links random_facts_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.random_facts_localizations_links
    ADD CONSTRAINT random_facts_localizations_links_inv_fk FOREIGN KEY (inv_random_fact_id) REFERENCES public.random_facts(id) ON DELETE CASCADE;


--
-- Name: random_facts random_facts_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.random_facts
    ADD CONSTRAINT random_facts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: schools schools_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT schools_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: schools_localizations_links schools_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools_localizations_links
    ADD CONSTRAINT schools_localizations_links_fk FOREIGN KEY (school_id) REFERENCES public.schools(id) ON DELETE CASCADE;


--
-- Name: schools_localizations_links schools_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools_localizations_links
    ADD CONSTRAINT schools_localizations_links_inv_fk FOREIGN KEY (inv_school_id) REFERENCES public.schools(id) ON DELETE CASCADE;


--
-- Name: schools schools_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT schools_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: skills skills_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: skills_localizations_links skills_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills_localizations_links
    ADD CONSTRAINT skills_localizations_links_fk FOREIGN KEY (skill_id) REFERENCES public.skills(id) ON DELETE CASCADE;


--
-- Name: skills_localizations_links skills_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills_localizations_links
    ADD CONSTRAINT skills_localizations_links_inv_fk FOREIGN KEY (inv_skill_id) REFERENCES public.skills(id) ON DELETE CASCADE;


--
-- Name: skills skills_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: software_development_intros software_development_intros_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.software_development_intros
    ADD CONSTRAINT software_development_intros_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: software_development_intros_localizations_links software_development_intros_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.software_development_intros_localizations_links
    ADD CONSTRAINT software_development_intros_localizations_links_fk FOREIGN KEY (software_development_intro_id) REFERENCES public.software_development_intros(id) ON DELETE CASCADE;


--
-- Name: software_development_intros_localizations_links software_development_intros_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.software_development_intros_localizations_links
    ADD CONSTRAINT software_development_intros_localizations_links_inv_fk FOREIGN KEY (inv_software_development_intro_id) REFERENCES public.software_development_intros(id) ON DELETE CASCADE;


--
-- Name: software_development_intros software_development_intros_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.software_development_intros
    ADD CONSTRAINT software_development_intros_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: software_development_intros_versions_links software_development_intros_versions_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.software_development_intros_versions_links
    ADD CONSTRAINT software_development_intros_versions_links_fk FOREIGN KEY (software_development_intro_id) REFERENCES public.software_development_intros(id) ON DELETE CASCADE;


--
-- Name: software_development_intros_versions_links software_development_intros_versions_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.software_development_intros_versions_links
    ADD CONSTRAINT software_development_intros_versions_links_inv_fk FOREIGN KEY (inv_software_development_intro_id) REFERENCES public.software_development_intros(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_inv_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_inv_fk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: tv_shows tv_shows_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tv_shows
    ADD CONSTRAINT tv_shows_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: tv_shows tv_shows_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tv_shows
    ADD CONSTRAINT tv_shows_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_inv_fk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: video_games video_games_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_games
    ADD CONSTRAINT video_games_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: video_games video_games_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_games
    ADD CONSTRAINT video_games_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

