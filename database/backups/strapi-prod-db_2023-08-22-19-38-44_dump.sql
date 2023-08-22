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
    year date,
    link character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
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
    locale character varying(255)
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
    year integer,
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
    year integer,
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
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (92, 'plugin::content-manager.explorer.create', 'api::publication.publication', '{"fields": ["title", "description", "publisher", "year", "link"], "locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.159', '2023-08-19 11:27:15.159', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (93, 'plugin::content-manager.explorer.create', 'api::school.school', '{"fields": ["schoolName", "flag", "degreeName", "degreeUrl", "grade", "start", "end", "description", "icon"], "locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.167', '2023-08-19 11:27:15.167', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (94, 'plugin::content-manager.explorer.create', 'api::skill.skill', '{"fields": ["title", "description", "icons"], "locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.174', '2023-08-19 11:27:15.174', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (95, 'plugin::content-manager.explorer.create', 'api::tv-show.tv-show', '{"fields": ["title", "year", "poster", "link"]}', '[]', '2023-08-19 11:27:15.181', '2023-08-19 11:27:15.181', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (96, 'plugin::content-manager.explorer.create', 'api::video-game.video-game', '{"fields": ["title", "year", "cover", "link"]}', '[]', '2023-08-19 11:27:15.188', '2023-08-19 11:27:15.188', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (99, 'plugin::content-manager.explorer.read', 'api::podcast.podcast', '{"fields": ["name", "author", "language", "cover", "mediaLink"]}', '[]', '2023-08-19 11:27:15.209', '2023-08-19 11:27:15.209', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (100, 'plugin::content-manager.explorer.read', 'api::publication.publication', '{"fields": ["title", "description", "publisher", "year", "link"], "locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.215', '2023-08-19 11:27:15.215', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (101, 'plugin::content-manager.explorer.read', 'api::school.school', '{"fields": ["schoolName", "flag", "degreeName", "degreeUrl", "grade", "start", "end", "description", "icon"], "locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.222', '2023-08-19 11:27:15.222', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (102, 'plugin::content-manager.explorer.read', 'api::skill.skill', '{"fields": ["title", "description", "icons"], "locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.228', '2023-08-19 11:27:15.228', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (103, 'plugin::content-manager.explorer.read', 'api::tv-show.tv-show', '{"fields": ["title", "year", "poster", "link"]}', '[]', '2023-08-19 11:27:15.235', '2023-08-19 11:27:15.235', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (104, 'plugin::content-manager.explorer.read', 'api::video-game.video-game', '{"fields": ["title", "year", "cover", "link"]}', '[]', '2023-08-19 11:27:15.242', '2023-08-19 11:27:15.242', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (107, 'plugin::content-manager.explorer.update', 'api::podcast.podcast', '{"fields": ["name", "author", "language", "cover", "mediaLink"]}', '[]', '2023-08-19 11:27:15.262', '2023-08-19 11:27:15.262', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (108, 'plugin::content-manager.explorer.update', 'api::publication.publication', '{"fields": ["title", "description", "publisher", "year", "link"], "locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.268', '2023-08-19 11:27:15.268', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (109, 'plugin::content-manager.explorer.update', 'api::school.school', '{"fields": ["schoolName", "flag", "degreeName", "degreeUrl", "grade", "start", "end", "description", "icon"], "locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.275', '2023-08-19 11:27:15.275', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (110, 'plugin::content-manager.explorer.update', 'api::skill.skill', '{"fields": ["title", "description", "icons"], "locales": ["en", "de", "it"]}', '[]', '2023-08-19 11:27:15.284', '2023-08-19 11:27:15.284', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (111, 'plugin::content-manager.explorer.update', 'api::tv-show.tv-show', '{"fields": ["title", "year", "poster", "link"]}', '[]', '2023-08-19 11:27:15.291', '2023-08-19 11:27:15.291', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (112, 'plugin::content-manager.explorer.update', 'api::video-game.video-game', '{"fields": ["title", "year", "cover", "link"]}', '[]', '2023-08-19 11:27:15.298', '2023-08-19 11:27:15.298', NULL, NULL);
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
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (132, 'plugin::content-manager.explorer.create', 'api::code-snippet.code-snippet', '{"fields": ["code", "language"]}', '[]', '2023-08-22 15:10:41.242', '2023-08-22 15:10:41.242', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (133, 'plugin::content-manager.explorer.create', 'api::language.language', '{"fields": ["name", "level", "flag", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-08-22 15:10:41.252', '2023-08-22 15:10:41.252', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (134, 'plugin::content-manager.explorer.read', 'api::code-snippet.code-snippet', '{"fields": ["code", "language"]}', '[]', '2023-08-22 15:10:41.261', '2023-08-22 15:10:41.261', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (135, 'plugin::content-manager.explorer.read', 'api::language.language', '{"fields": ["name", "level", "flag", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-08-22 15:10:41.269', '2023-08-22 15:10:41.269', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (136, 'plugin::content-manager.explorer.update', 'api::code-snippet.code-snippet', '{"fields": ["code", "language"]}', '[]', '2023-08-22 15:10:41.278', '2023-08-22 15:10:41.278', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (137, 'plugin::content-manager.explorer.update', 'api::language.language', '{"fields": ["name", "level", "flag", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-08-22 15:10:41.286', '2023-08-22 15:10:41.286', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (138, 'plugin::content-manager.explorer.delete', 'api::code-snippet.code-snippet', '{}', '[]', '2023-08-22 15:10:41.293', '2023-08-22 15:10:41.293', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (139, 'plugin::content-manager.explorer.publish', 'api::code-snippet.code-snippet', '{}', '[]', '2023-08-22 15:10:41.3', '2023-08-22 15:10:41.3', NULL, NULL);


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
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (102, 92, 1, 80);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (103, 93, 1, 81);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (104, 94, 1, 82);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (105, 95, 1, 83);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (106, 96, 1, 84);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (109, 99, 1, 87);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (110, 100, 1, 88);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (111, 101, 1, 89);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (112, 102, 1, 90);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (113, 103, 1, 91);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (114, 104, 1, 92);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (117, 107, 1, 95);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (118, 108, 1, 96);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (119, 109, 1, 97);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (120, 110, 1, 98);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (121, 111, 1, 99);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (122, 112, 1, 100);
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
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (142, 132, 1, 120);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (143, 133, 1, 121);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (144, 134, 1, 122);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (145, 135, 1, 123);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (146, 136, 1, 124);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (147, 137, 1, 125);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (148, 138, 1, 126);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (149, 139, 1, 127);


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



--
-- Data for Name: books_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: code_snippets; Type: TABLE DATA; Schema: public; Owner: postgres
--



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


--
-- Data for Name: files_folder_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



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



--
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.publications (id, title, description, publisher, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (1, 'Cloud Computing and the New EU General Data Protection Regulation', 'Research project', 'IEEE Cloud Computing', NULL, NULL, '2023-08-22 17:29:21.325', '2023-08-22 17:29:21.325', NULL, 1, 1, 'en');


--
-- Data for Name: publications_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
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



--
-- Data for Name: skills_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
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
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (18, 'plugin_users-permissions_grant', '{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"enabled":false,"icon":"","key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (19, 'plugin_users-permissions_email', '{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\n\n<p>But don’t worry! You can use the following link to reset your password:</p>\n<p><%= URL %>?code=<%= TOKEN %></p>\n\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\n\n<p>You have to confirm your email address. Please click on the link below.</p>\n\n<p><%= URL %>?confirmation=<%= CODE %></p>\n\n<p>Thanks.</p>"}}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (20, 'plugin_users-permissions_advanced', '{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (1, 'strapi_content_types_schema', '{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token-permission","connection":"default","uid":"admin::api-token-permission","plugin":"admin","globalId":"AdminApiTokenPermission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token","connection":"default","uid":"admin::transfer-token","plugin":"admin","globalId":"AdminTransferToken"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token-permission","connection":"default","uid":"admin::transfer-token-permission","plugin":"admin","globalId":"AdminTransferTokenPermission"},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"folder","connection":"default","uid":"plugin::upload.folder","plugin":"upload","globalId":"UploadFolder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"},"plugin::menus.menu":{"kind":"collectionType","collectionName":"menus","info":{"displayName":"Menu","singularName":"menu","pluralName":"menus","tableName":"menus"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"title":{"type":"string","required":true},"slug":{"type":"uid","targetField":"title","required":true},"items":{"type":"relation","relation":"oneToMany","target":"plugin::menus.menu-item","mappedBy":"root_menu"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"menus","info":{"displayName":"Menu","singularName":"menu","pluralName":"menus","tableName":"menus"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"title":{"type":"string","required":true},"slug":{"type":"uid","targetField":"title","required":true},"items":{"type":"relation","relation":"oneToMany","target":"plugin::menus.menu-item","mappedBy":"root_menu"}},"kind":"collectionType"},"modelType":"contentType","modelName":"menu","connection":"default","uid":"plugin::menus.menu","plugin":"menus","globalId":"MenusMenu"},"plugin::menus.menu-item":{"kind":"collectionType","collectionName":"menu_items","info":{"displayName":"Menu Item","singularName":"menu-item","pluralName":"menu-items","tableName":"menu_items"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"order":{"type":"integer"},"title":{"type":"string","required":true},"url":{"type":"string"},"target":{"type":"enumeration","enum":["_blank","_parent","_self","_top"]},"root_menu":{"type":"relation","relation":"manyToOne","target":"plugin::menus.menu","inversedBy":"items","required":true},"parent":{"type":"relation","relation":"oneToOne","target":"plugin::menus.menu-item"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"menu_items","info":{"displayName":"Menu Item","singularName":"menu-item","pluralName":"menu-items","tableName":"menu_items"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"order":{"type":"integer"},"title":{"type":"string","required":true},"url":{"type":"string"},"target":{"type":"enumeration","enum":["_blank","_parent","_self","_top"]},"root_menu":{"type":"relation","relation":"manyToOne","target":"plugin::menus.menu","inversedBy":"items","required":true},"parent":{"type":"relation","relation":"oneToOne","target":"plugin::menus.menu-item"}},"kind":"collectionType"},"modelType":"contentType","modelName":"menu-item","connection":"default","uid":"plugin::menus.menu-item","plugin":"menus","globalId":"MenusMenuItem"},"plugin::react-icons.iconlibrary":{"kind":"collectionType","collectionName":"iconlibrary","info":{"singularName":"iconlibrary","pluralName":"iconlibraries","displayName":"IconLibrary"},"options":{"draftAndPublish":false,"comment":""},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"abbreviation":{"type":"string","required":true,"unique":true,"maxLength":3},"isEnabled":{"type":"boolean","default":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"iconlibrary","info":{"singularName":"iconlibrary","pluralName":"iconlibraries","displayName":"IconLibrary"},"options":{"draftAndPublish":false,"comment":""},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"abbreviation":{"type":"string","required":true,"unique":true,"maxLength":3},"isEnabled":{"type":"boolean","default":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"iconlibrary","connection":"default","uid":"plugin::react-icons.iconlibrary","plugin":"react-icons","globalId":"ReactIconsIconlibrary"},"api::book.book":{"kind":"collectionType","collectionName":"books","info":{"singularName":"book","pluralName":"books","displayName":"Book","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"author":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"goodreadsLink":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"genre":{"pluginOptions":{"i18n":{"localized":true}},"type":"enumeration","enum":["Fiction","Non-fiction"]},"rank":{"pluginOptions":{"i18n":{"localized":true}},"type":"integer"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::book.book"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"books","info":{"singularName":"book","pluralName":"books","displayName":"Book","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"author":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"goodreadsLink":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"genre":{"pluginOptions":{"i18n":{"localized":true}},"type":"enumeration","enum":["Fiction","Non-fiction"]},"rank":{"pluginOptions":{"i18n":{"localized":true}},"type":"integer"}},"kind":"collectionType"},"modelType":"contentType","modelName":"book","connection":"default","uid":"api::book.book","apiName":"book","globalId":"Book","actions":{},"lifecycles":{}},"api::code-snippet.code-snippet":{"kind":"collectionType","collectionName":"code_snippets","info":{"singularName":"code-snippet","pluralName":"code-snippets","displayName":"Code Snippet"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"code":{"type":"text"},"language":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"code_snippets","info":{"singularName":"code-snippet","pluralName":"code-snippets","displayName":"Code Snippet"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"code":{"type":"text"},"language":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"code-snippet","connection":"default","uid":"api::code-snippet.code-snippet","apiName":"code-snippet","globalId":"CodeSnippet","actions":{},"lifecycles":{}},"api::job.job":{"kind":"collectionType","collectionName":"jobs","info":{"singularName":"job","pluralName":"jobs","displayName":"Job","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"companyName":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"icon":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"location":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"startDate":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"endDate":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"isCurrentJob":{"pluginOptions":{"i18n":{"localized":false}},"type":"boolean"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"mainColor":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","regex":"^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$","customField":"plugin::color-picker.color"},"darkColor":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","regex":"^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$","customField":"plugin::color-picker.color"},"technologies":{"pluginOptions":{"i18n":{"localized":false}},"type":"json"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::job.job"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"jobs","info":{"singularName":"job","pluralName":"jobs","displayName":"Job","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"companyName":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"icon":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"location":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"startDate":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"endDate":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"isCurrentJob":{"pluginOptions":{"i18n":{"localized":false}},"type":"boolean"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"mainColor":{"pluginOptions":{"i18n":{"localized":false}},"type":"customField","regex":"^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$","customField":"plugin::color-picker.color"},"darkColor":{"pluginOptions":{"i18n":{"localized":false}},"type":"customField","regex":"^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$","customField":"plugin::color-picker.color"},"technologies":{"pluginOptions":{"i18n":{"localized":false}},"type":"json"}},"kind":"collectionType"},"modelType":"contentType","modelName":"job","connection":"default","uid":"api::job.job","apiName":"job","globalId":"Job","actions":{},"lifecycles":{}},"api::language.language":{"kind":"collectionType","collectionName":"languages","info":{"singularName":"language","pluralName":"languages","displayName":"Language","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"level":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"flag":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"rank":{"pluginOptions":{"i18n":{"localized":true}},"type":"integer"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::language.language"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"languages","info":{"singularName":"language","pluralName":"languages","displayName":"Language","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"level":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"flag":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"rank":{"pluginOptions":{"i18n":{"localized":true}},"type":"integer"}},"kind":"collectionType"},"modelType":"contentType","modelName":"language","connection":"default","uid":"api::language.language","apiName":"language","globalId":"Language","actions":{},"lifecycles":{}},"api::podcast.podcast":{"kind":"collectionType","collectionName":"podcasts","info":{"singularName":"podcast","pluralName":"podcasts","displayName":"Podcast"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"author":{"type":"string"},"language":{"type":"enumeration","enum":["en","it"]},"cover":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"mediaLink":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"podcasts","info":{"singularName":"podcast","pluralName":"podcasts","displayName":"Podcast"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"author":{"type":"string"},"language":{"type":"enumeration","enum":["en","it"]},"cover":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"mediaLink":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"podcast","connection":"default","uid":"api::podcast.podcast","apiName":"podcast","globalId":"Podcast","actions":{},"lifecycles":{}},"api::publication.publication":{"kind":"collectionType","collectionName":"publications","info":{"singularName":"publication","pluralName":"publications","displayName":"Publication","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","pluginOptions":{"i18n":{"localized":false}}},"description":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"publisher":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"year":{"pluginOptions":{"i18n":{"localized":true}},"type":"date"},"link":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::publication.publication"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"publications","info":{"singularName":"publication","pluralName":"publications","displayName":"Publication","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","pluginOptions":{"i18n":{"localized":false}}},"description":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"publisher":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"year":{"pluginOptions":{"i18n":{"localized":true}},"type":"date"},"link":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"publication","connection":"default","uid":"api::publication.publication","apiName":"publication","globalId":"Publication","actions":{},"lifecycles":{}},"api::school.school":{"kind":"collectionType","collectionName":"schools","info":{"singularName":"school","pluralName":"schools","displayName":"School"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"schoolName":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"flag":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}}},"degreeName":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"degreeUrl":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"grade":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"start":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"end":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"icon":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::school.school"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"schools","info":{"singularName":"school","pluralName":"schools","displayName":"School"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"schoolName":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"flag":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}}},"degreeName":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"degreeUrl":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"grade":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"start":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"end":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"icon":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}}}},"kind":"collectionType"},"modelType":"contentType","modelName":"school","connection":"default","uid":"api::school.school","apiName":"school","globalId":"School","actions":{},"lifecycles":{}},"api::skill.skill":{"kind":"collectionType","collectionName":"skills","info":{"singularName":"skill","pluralName":"skills","displayName":"Skill"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"icons":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":true,"pluginOptions":{"i18n":{"localized":true}}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::skill.skill"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"skills","info":{"singularName":"skill","pluralName":"skills","displayName":"Skill"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"icons":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":true,"pluginOptions":{"i18n":{"localized":true}}}},"kind":"collectionType"},"modelType":"contentType","modelName":"skill","connection":"default","uid":"api::skill.skill","apiName":"skill","globalId":"Skill","actions":{},"lifecycles":{}},"api::tv-show.tv-show":{"kind":"collectionType","collectionName":"tv_shows","info":{"singularName":"tv-show","pluralName":"tv-shows","displayName":"TvShow"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"year":{"type":"integer"},"poster":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"link":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"tv_shows","info":{"singularName":"tv-show","pluralName":"tv-shows","displayName":"TvShow"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"year":{"type":"integer"},"poster":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"link":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"tv-show","connection":"default","uid":"api::tv-show.tv-show","apiName":"tv-show","globalId":"TvShow","actions":{},"lifecycles":{}},"api::video-game.video-game":{"kind":"collectionType","collectionName":"video_games","info":{"singularName":"video-game","pluralName":"video-games","displayName":"VideoGame"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"year":{"type":"integer"},"cover":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"link":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"video_games","info":{"singularName":"video-game","pluralName":"video-games","displayName":"VideoGame"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"year":{"type":"integer"},"cover":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"link":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"video-game","connection":"default","uid":"api::video-game.video-game","apiName":"video-game","globalId":"VideoGame","actions":{},"lifecycles":{}}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (27, 'plugin_documentation_config', '{"restrictedAccess":false}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (13, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.role', '{"uid":"plugin::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (40, 'plugin_content_manager_configuration_content_types::api::code-snippet.code-snippet', '{"uid":"api::code-snippet.code-snippet","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"language","defaultSortBy":"language","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"language":{"edit":{"label":"language","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"language","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","code","language","createdAt"],"edit":[[{"name":"code","size":6},{"name":"language","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (22, 'core_admin_auth', '{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (24, 'plugin_content_manager_configuration_content_types::plugin::menus.menu', '{"uid":"plugin::menus.menu","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"items":{"edit":{"label":"items","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"items","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","slug","items"],"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"items","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (31, 'plugin_drag-drop-content-types_settings', '{"body":{"rank":"rank","title":""}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (14, 'plugin_content_manager_configuration_content_types::plugin::i18n.locale', '{"uid":"plugin::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (21, 'plugin_i18n_default_locale', '"en"', 'string', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (23, 'plugin_content_manager_configuration_content_types::api::job.job', '{"uid":"api::job.job","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"companyName","defaultSortBy":"startDate","defaultSortOrder":"DESC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"companyName":{"edit":{"label":"companyName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"companyName","searchable":true,"sortable":true}},"icon":{"edit":{"label":"icon","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icon","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"location":{"edit":{"label":"location","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"location","searchable":true,"sortable":true}},"startDate":{"edit":{"label":"startDate","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"startDate","searchable":true,"sortable":true}},"endDate":{"edit":{"label":"endDate","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"endDate","searchable":true,"sortable":true}},"isCurrentJob":{"edit":{"label":"isCurrentJob","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isCurrentJob","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":false,"sortable":false}},"mainColor":{"edit":{"label":"mainColor","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mainColor","searchable":true,"sortable":true}},"darkColor":{"edit":{"label":"darkColor","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"darkColor","searchable":true,"sortable":true}},"technologies":{"edit":{"label":"technologies","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"technologies","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"companyName","size":6},{"name":"icon","size":6}],[{"name":"title","size":6},{"name":"location","size":6}],[{"name":"startDate","size":4},{"name":"endDate","size":4},{"name":"isCurrentJob","size":4}],[{"name":"description","size":12}],[{"name":"mainColor","size":6},{"name":"darkColor","size":6}],[{"name":"technologies","size":12}]],"list":["id","companyName","icon","title"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (33, 'plugin_content_manager_configuration_content_types::api::language.language', '{"uid":"api::language.language","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"level":{"edit":{"label":"level","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"level","searchable":true,"sortable":true}},"flag":{"edit":{"label":"flag","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"flag","searchable":false,"sortable":false}},"rank":{"edit":{"label":"rank","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"rank","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","level","flag"],"edit":[[{"name":"name","size":6},{"name":"level","size":6}],[{"name":"flag","size":6},{"name":"rank","size":4}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (25, 'plugin_content_manager_configuration_content_types::plugin::react-icons.iconlibrary', '{"uid":"plugin::react-icons.iconlibrary","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"abbreviation":{"edit":{"label":"abbreviation","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"abbreviation","searchable":true,"sortable":true}},"isEnabled":{"edit":{"label":"isEnabled","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEnabled","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","abbreviation","isEnabled"],"edit":[[{"name":"name","size":6},{"name":"abbreviation","size":6}],[{"name":"isEnabled","size":4}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (26, 'plugin_content_manager_configuration_content_types::plugin::menus.menu-item', '{"uid":"plugin::menus.menu-item","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"order":{"edit":{"label":"order","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"order","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"target":{"edit":{"label":"target","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"target","searchable":true,"sortable":true}},"root_menu":{"edit":{"label":"root_menu","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"root_menu","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"parent","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","order","title","url"],"edit":[[{"name":"order","size":4},{"name":"title","size":6}],[{"name":"url","size":6},{"name":"target","size":6}],[{"name":"root_menu","size":6},{"name":"parent","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (28, 'plugin_responsive-image_settings', '{"formats":[{"name":"large","width":1000,"fit":"cover","position":"centre","withoutEnlargement":false,"convertToFormat":""},{"name":"medium","width":750,"fit":"cover","position":"centre","withoutEnlargement":false,"convertToFormat":""},{"name":"small","width":500,"fit":"cover","position":"centre","withoutEnlargement":false,"convertToFormat":""}],"quality":87,"progressive":true}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (29, 'plugin_content_manager_configuration_components::shared.meta-social', '{"uid":"shared.meta-social","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"socialNetwork":{"edit":{"label":"socialNetwork","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"socialNetwork","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}}},"layouts":{"list":["id","socialNetwork","title","description"],"edit":[[{"name":"socialNetwork","size":6},{"name":"title","size":6}],[{"name":"description","size":6},{"name":"image","size":6}]]},"isComponent":true}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (30, 'plugin_content_manager_configuration_components::shared.seo', '{"uid":"shared.seo","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"metaTitle","defaultSortBy":"metaTitle","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"metaTitle":{"edit":{"label":"metaTitle","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaTitle","searchable":true,"sortable":true}},"metaDescription":{"edit":{"label":"metaDescription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaDescription","searchable":true,"sortable":true}},"metaImage":{"edit":{"label":"metaImage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaImage","searchable":false,"sortable":false}},"metaSocial":{"edit":{"label":"metaSocial","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaSocial","searchable":false,"sortable":false}},"keywords":{"edit":{"label":"keywords","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"keywords","searchable":true,"sortable":true}},"metaRobots":{"edit":{"label":"metaRobots","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaRobots","searchable":true,"sortable":true}},"structuredData":{"edit":{"label":"structuredData","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"structuredData","searchable":false,"sortable":false}},"metaViewport":{"edit":{"label":"metaViewport","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaViewport","searchable":true,"sortable":true}},"canonicalURL":{"edit":{"label":"canonicalURL","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"canonicalURL","searchable":true,"sortable":true}}},"layouts":{"list":["id","metaTitle","metaDescription","metaImage"],"edit":[[{"name":"metaTitle","size":6},{"name":"metaDescription","size":6}],[{"name":"metaImage","size":6}],[{"name":"metaSocial","size":12}],[{"name":"keywords","size":6},{"name":"metaRobots","size":6}],[{"name":"structuredData","size":12}],[{"name":"metaViewport","size":6},{"name":"canonicalURL","size":6}]]},"isComponent":true}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (17, 'plugin_upload_metrics', '{"weeklySchedule":"28 23 18 * * 0","lastWeeklyUpdate":1692555808031}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (34, 'plugin_content_manager_configuration_content_types::api::podcast.podcast', '{"uid":"api::podcast.podcast","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"author":{"edit":{"label":"author","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"author","searchable":true,"sortable":true}},"language":{"edit":{"label":"language","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"language","searchable":true,"sortable":true}},"cover":{"edit":{"label":"cover","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cover","searchable":false,"sortable":false}},"mediaLink":{"edit":{"label":"mediaLink","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mediaLink","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","author","language"],"edit":[[{"name":"name","size":6},{"name":"author","size":6}],[{"name":"language","size":6},{"name":"cover","size":6}],[{"name":"mediaLink","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (35, 'plugin_content_manager_configuration_content_types::api::skill.skill', '{"uid":"api::skill.skill","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":false,"sortable":false}},"icons":{"edit":{"label":"icons","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icons","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","icons","createdAt"],"edit":[[{"name":"title","size":6}],[{"name":"description","size":12}],[{"name":"icons","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (37, 'plugin_content_manager_configuration_content_types::api::tv-show.tv-show', '{"uid":"api::tv-show.tv-show","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"year":{"edit":{"label":"year","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"year","searchable":true,"sortable":true}},"poster":{"edit":{"label":"poster","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"poster","searchable":false,"sortable":false}},"link":{"edit":{"label":"link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"link","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","year","poster"],"edit":[[{"name":"title","size":6},{"name":"year","size":4}],[{"name":"poster","size":6},{"name":"link","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (36, 'plugin_content_manager_configuration_content_types::api::school.school', '{"uid":"api::school.school","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"schoolName","defaultSortBy":"start","defaultSortOrder":"DESC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"schoolName":{"edit":{"label":"schoolName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"schoolName","searchable":true,"sortable":true}},"flag":{"edit":{"label":"flag","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"flag","searchable":false,"sortable":false}},"degreeName":{"edit":{"label":"degreeName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"degreeName","searchable":true,"sortable":true}},"degreeUrl":{"edit":{"label":"degreeUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"degreeUrl","searchable":true,"sortable":true}},"grade":{"edit":{"label":"grade","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"grade","searchable":true,"sortable":true}},"start":{"edit":{"label":"start","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"start","searchable":true,"sortable":true}},"end":{"edit":{"label":"end","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"end","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":false,"sortable":false}},"icon":{"edit":{"label":"icon","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icon","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"schoolName","size":6}],[{"name":"degreeName","size":6},{"name":"degreeUrl","size":6}],[{"name":"grade","size":6}],[{"name":"start","size":4},{"name":"end","size":4}],[{"name":"description","size":12}],[{"name":"icon","size":6},{"name":"flag","size":6}]],"list":["id","icon","schoolName","degreeName"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (38, 'plugin_content_manager_configuration_content_types::api::publication.publication', '{"uid":"api::publication.publication","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"publisher":{"edit":{"label":"publisher","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"publisher","searchable":true,"sortable":true}},"year":{"edit":{"label":"year","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"year","searchable":true,"sortable":true}},"link":{"edit":{"label":"link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"link","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","description","publisher"],"edit":[[{"name":"title","size":6},{"name":"description","size":6}],[{"name":"publisher","size":6},{"name":"year","size":4}],[{"name":"link","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (39, 'plugin_content_manager_configuration_content_types::api::video-game.video-game', '{"uid":"api::video-game.video-game","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"year":{"edit":{"label":"year","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"year","searchable":true,"sortable":true}},"cover":{"edit":{"label":"cover","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cover","searchable":false,"sortable":false}},"link":{"edit":{"label":"link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"link","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","year","cover"],"edit":[[{"name":"title","size":6},{"name":"year","size":4}],[{"name":"cover","size":6},{"name":"link","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (32, 'plugin_content_manager_configuration_content_types::api::book.book', '{"uid":"api::book.book","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"author":{"edit":{"label":"author","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"author","searchable":true,"sortable":true}},"cover":{"edit":{"label":"cover","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cover","searchable":false,"sortable":false}},"goodreadsLink":{"edit":{"label":"goodreadsLink","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"goodreadsLink","searchable":true,"sortable":true}},"genre":{"edit":{"label":"genre","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"genre","searchable":true,"sortable":true}},"rank":{"edit":{"label":"rank","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"rank","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","author","cover"],"edit":[[{"name":"title","size":6},{"name":"author","size":6}],[{"name":"cover","size":6},{"name":"goodreadsLink","size":6}],[{"name":"genre","size":6},{"name":"rank","size":4}]]}}', 'object', NULL, NULL);


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.strapi_database_schema (id, schema, "time", hash) VALUES (9, '{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"menus","indexes":[{"type":"unique","name":"menus_slug_unique","columns":["slug"]},{"name":"menus_created_by_id_fk","columns":["created_by_id"]},{"name":"menus_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"menus_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"menus_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"menu_items","indexes":[{"name":"menu_items_created_by_id_fk","columns":["created_by_id"]},{"name":"menu_items_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"menu_items_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"menu_items_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"target","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"iconlibrary","indexes":[{"name":"iconlibrary_created_by_id_fk","columns":["created_by_id"]},{"name":"iconlibrary_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"iconlibrary_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"iconlibrary_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"abbreviation","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"books","indexes":[{"name":"books_created_by_id_fk","columns":["created_by_id"]},{"name":"books_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"books_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"books_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"author","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"goodreads_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"genre","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"rank","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"code_snippets","indexes":[{"name":"code_snippets_created_by_id_fk","columns":["created_by_id"]},{"name":"code_snippets_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"code_snippets_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"code_snippets_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"code","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"jobs","indexes":[{"name":"jobs_created_by_id_fk","columns":["created_by_id"]},{"name":"jobs_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"jobs_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"jobs_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"company_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"location","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"start_date","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"end_date","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_current_job","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"main_color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"dark_color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"technologies","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"languages","indexes":[{"name":"languages_created_by_id_fk","columns":["created_by_id"]},{"name":"languages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"languages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"languages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"level","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"rank","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"podcasts","indexes":[{"name":"podcasts_created_by_id_fk","columns":["created_by_id"]},{"name":"podcasts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"podcasts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"podcasts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"author","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"media_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"publications","indexes":[{"name":"publications_created_by_id_fk","columns":["created_by_id"]},{"name":"publications_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"publications_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"publications_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"publisher","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"year","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"schools","indexes":[{"name":"schools_created_by_id_fk","columns":["created_by_id"]},{"name":"schools_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"schools_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"schools_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"school_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"degree_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"degree_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"grade","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"start","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"end","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"skills","indexes":[{"name":"skills_created_by_id_fk","columns":["created_by_id"]},{"name":"skills_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"skills_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"skills_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"tv_shows","indexes":[{"name":"tv_shows_created_by_id_fk","columns":["created_by_id"]},{"name":"tv_shows_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"tv_shows_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"tv_shows_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"year","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"video_games","indexes":[{"name":"video_games_created_by_id_fk","columns":["created_by_id"]},{"name":"video_games_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"video_games_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"video_games_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"year","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_shared_meta_socials","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"social_network","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_shared_seos","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"meta_title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"keywords","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_robots","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"structured_data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_viewport","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"canonical_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"admin_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]},{"name":"admin_users_roles_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_links_order_fk","columns":["role_order"]},{"name":"admin_users_roles_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_links","indexes":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_links_unique","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_links_order_inv_fk","columns":["api_token_permission_order"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_links","indexes":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_links_unique","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_links_order_inv_fk","columns":["transfer_token_permission_order"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]},{"name":"files_related_morphs_order_index","columns":["order"],"type":null},{"name":"files_related_morphs_id_column_index","columns":["related_id"],"type":null}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_links","indexes":[{"name":"files_folder_links_fk","columns":["file_id"]},{"name":"files_folder_links_inv_fk","columns":["folder_id"]},{"name":"files_folder_links_unique","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_links_order_inv_fk","columns":["file_order"]}],"foreignKeys":[{"name":"files_folder_links_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_links_inv_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_links","indexes":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"]},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_links_unique","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_links_order_inv_fk","columns":["folder_order"]}],"foreignKeys":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"up_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]},{"name":"up_users_role_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"menu_items_root_menu_links","indexes":[{"name":"menu_items_root_menu_links_fk","columns":["menu_item_id"]},{"name":"menu_items_root_menu_links_inv_fk","columns":["menu_id"]},{"name":"menu_items_root_menu_links_unique","columns":["menu_item_id","menu_id"],"type":"unique"},{"name":"menu_items_root_menu_links_order_inv_fk","columns":["menu_item_order"]}],"foreignKeys":[{"name":"menu_items_root_menu_links_fk","columns":["menu_item_id"],"referencedColumns":["id"],"referencedTable":"menu_items","onDelete":"CASCADE"},{"name":"menu_items_root_menu_links_inv_fk","columns":["menu_id"],"referencedColumns":["id"],"referencedTable":"menus","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"menu_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"menu_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"menu_item_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"menu_items_parent_links","indexes":[{"name":"menu_items_parent_links_fk","columns":["menu_item_id"]},{"name":"menu_items_parent_links_inv_fk","columns":["inv_menu_item_id"]},{"name":"menu_items_parent_links_unique","columns":["menu_item_id","inv_menu_item_id"],"type":"unique"}],"foreignKeys":[{"name":"menu_items_parent_links_fk","columns":["menu_item_id"],"referencedColumns":["id"],"referencedTable":"menu_items","onDelete":"CASCADE"},{"name":"menu_items_parent_links_inv_fk","columns":["inv_menu_item_id"],"referencedColumns":["id"],"referencedTable":"menu_items","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"menu_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_menu_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"books_localizations_links","indexes":[{"name":"books_localizations_links_fk","columns":["book_id"]},{"name":"books_localizations_links_inv_fk","columns":["inv_book_id"]},{"name":"books_localizations_links_unique","columns":["book_id","inv_book_id"],"type":"unique"},{"name":"books_localizations_links_order_fk","columns":["book_order"]}],"foreignKeys":[{"name":"books_localizations_links_fk","columns":["book_id"],"referencedColumns":["id"],"referencedTable":"books","onDelete":"CASCADE"},{"name":"books_localizations_links_inv_fk","columns":["inv_book_id"],"referencedColumns":["id"],"referencedTable":"books","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"book_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_book_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"book_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"jobs_localizations_links","indexes":[{"name":"jobs_localizations_links_fk","columns":["job_id"]},{"name":"jobs_localizations_links_inv_fk","columns":["inv_job_id"]},{"name":"jobs_localizations_links_unique","columns":["job_id","inv_job_id"],"type":"unique"},{"name":"jobs_localizations_links_order_fk","columns":["job_order"]}],"foreignKeys":[{"name":"jobs_localizations_links_fk","columns":["job_id"],"referencedColumns":["id"],"referencedTable":"jobs","onDelete":"CASCADE"},{"name":"jobs_localizations_links_inv_fk","columns":["inv_job_id"],"referencedColumns":["id"],"referencedTable":"jobs","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"job_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_job_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"job_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"languages_localizations_links","indexes":[{"name":"languages_localizations_links_fk","columns":["language_id"]},{"name":"languages_localizations_links_inv_fk","columns":["inv_language_id"]},{"name":"languages_localizations_links_unique","columns":["language_id","inv_language_id"],"type":"unique"},{"name":"languages_localizations_links_order_fk","columns":["language_order"]}],"foreignKeys":[{"name":"languages_localizations_links_fk","columns":["language_id"],"referencedColumns":["id"],"referencedTable":"languages","onDelete":"CASCADE"},{"name":"languages_localizations_links_inv_fk","columns":["inv_language_id"],"referencedColumns":["id"],"referencedTable":"languages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"language_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_language_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"language_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"publications_localizations_links","indexes":[{"name":"publications_localizations_links_fk","columns":["publication_id"]},{"name":"publications_localizations_links_inv_fk","columns":["inv_publication_id"]},{"name":"publications_localizations_links_unique","columns":["publication_id","inv_publication_id"],"type":"unique"},{"name":"publications_localizations_links_order_fk","columns":["publication_order"]}],"foreignKeys":[{"name":"publications_localizations_links_fk","columns":["publication_id"],"referencedColumns":["id"],"referencedTable":"publications","onDelete":"CASCADE"},{"name":"publications_localizations_links_inv_fk","columns":["inv_publication_id"],"referencedColumns":["id"],"referencedTable":"publications","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"publication_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_publication_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"publication_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"schools_localizations_links","indexes":[{"name":"schools_localizations_links_fk","columns":["school_id"]},{"name":"schools_localizations_links_inv_fk","columns":["inv_school_id"]},{"name":"schools_localizations_links_unique","columns":["school_id","inv_school_id"],"type":"unique"},{"name":"schools_localizations_links_order_fk","columns":["school_order"]}],"foreignKeys":[{"name":"schools_localizations_links_fk","columns":["school_id"],"referencedColumns":["id"],"referencedTable":"schools","onDelete":"CASCADE"},{"name":"schools_localizations_links_inv_fk","columns":["inv_school_id"],"referencedColumns":["id"],"referencedTable":"schools","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"school_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_school_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"school_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"skills_localizations_links","indexes":[{"name":"skills_localizations_links_fk","columns":["skill_id"]},{"name":"skills_localizations_links_inv_fk","columns":["inv_skill_id"]},{"name":"skills_localizations_links_unique","columns":["skill_id","inv_skill_id"],"type":"unique"},{"name":"skills_localizations_links_order_fk","columns":["skill_order"]}],"foreignKeys":[{"name":"skills_localizations_links_fk","columns":["skill_id"],"referencedColumns":["id"],"referencedTable":"skills","onDelete":"CASCADE"},{"name":"skills_localizations_links_inv_fk","columns":["inv_skill_id"],"referencedColumns":["id"],"referencedTable":"skills","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"skill_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_skill_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"skill_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_shared_seos_components","indexes":[{"name":"components_shared_seos_field_index","columns":["field"],"type":null},{"name":"components_shared_seos_component_type_index","columns":["component_type"],"type":null},{"name":"components_shared_seos_entity_fk","columns":["entity_id"]},{"name":"components_shared_seos_unique","columns":["entity_id","component_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_shared_seos_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_shared_seos","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}', '2023-08-22 15:10:40.167', '85c05987ea0440108d612c07c9512506');


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


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) VALUES (1, 'Authenticated', 'Default role given to authenticated user.', 'authenticated', '2023-08-13 18:13:24.188', '2023-08-13 18:13:24.188', NULL, NULL);
INSERT INTO public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) VALUES (2, 'Public', 'Default role given to unauthenticated user.', 'public', '2023-08-13 18:13:24.195', '2023-08-22 15:15:55.173', NULL, NULL);


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: upload_folders_parent_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: video_games; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 139, true);


--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 149, true);


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

SELECT pg_catalog.setval('public.books_id_seq', 1, false);


--
-- Name: books_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_localizations_links_id_seq', 1, false);


--
-- Name: code_snippets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.code_snippets_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.files_folder_links_id_seq', 1, false);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 14, true);


--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 37, true);


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

SELECT pg_catalog.setval('public.podcasts_id_seq', 1, false);


--
-- Name: publications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publications_id_seq', 1, true);


--
-- Name: publications_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publications_localizations_links_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.skills_id_seq', 1, false);


--
-- Name: skills_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skills_localizations_links_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 40, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 9, true);


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

SELECT pg_catalog.setval('public.tv_shows_id_seq', 1, false);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 27, true);


--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 27, true);


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

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);


--
-- Name: video_games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.video_games_id_seq', 1, false);


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

