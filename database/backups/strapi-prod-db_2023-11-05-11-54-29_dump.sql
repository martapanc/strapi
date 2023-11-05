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
    updated_by_id integer,
    action_parameters jsonb
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
-- Name: components_shared_titled_paragraphs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_shared_titled_paragraphs (
    id integer NOT NULL,
    title character varying(255),
    content text,
    outro text
);


ALTER TABLE public.components_shared_titled_paragraphs OWNER TO postgres;

--
-- Name: components_shared_titled_paragraphs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_shared_titled_paragraphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_shared_titled_paragraphs_id_seq OWNER TO postgres;

--
-- Name: components_shared_titled_paragraphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_shared_titled_paragraphs_id_seq OWNED BY public.components_shared_titled_paragraphs.id;


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
-- Name: home_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_pages (
    id integer NOT NULL,
    greeting character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    introduction_1 text,
    introduction_2 text,
    introduction_3 text,
    introduction_4 text,
    introduction_5 text
);


ALTER TABLE public.home_pages OWNER TO postgres;

--
-- Name: home_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_pages_id_seq OWNER TO postgres;

--
-- Name: home_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_pages_id_seq OWNED BY public.home_pages.id;


--
-- Name: home_pages_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_pages_localizations_links (
    id integer NOT NULL,
    home_page_id integer,
    inv_home_page_id integer,
    home_page_order double precision
);


ALTER TABLE public.home_pages_localizations_links OWNER TO postgres;

--
-- Name: home_pages_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_pages_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_pages_localizations_links_id_seq OWNER TO postgres;

--
-- Name: home_pages_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_pages_localizations_links_id_seq OWNED BY public.home_pages_localizations_links.id;


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
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title character varying(255),
    short_description text,
    long_description text,
    tools character varying(255),
    date date,
    tags character varying(255),
    links jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: projects_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_localizations_links (
    id integer NOT NULL,
    project_id integer,
    inv_project_id integer,
    project_order double precision
);


ALTER TABLE public.projects_localizations_links OWNER TO postgres;

--
-- Name: projects_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_localizations_links_id_seq OWNER TO postgres;

--
-- Name: projects_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_localizations_links_id_seq OWNED BY public.projects_localizations_links.id;


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
    rank integer,
    file_url character varying(255)
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
-- Name: recruiters_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recruiters_pages (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    intro text,
    outro text
);


ALTER TABLE public.recruiters_pages OWNER TO postgres;

--
-- Name: recruiters_pages_components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recruiters_pages_components (
    id integer NOT NULL,
    entity_id integer,
    component_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.recruiters_pages_components OWNER TO postgres;

--
-- Name: recruiters_pages_components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recruiters_pages_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recruiters_pages_components_id_seq OWNER TO postgres;

--
-- Name: recruiters_pages_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recruiters_pages_components_id_seq OWNED BY public.recruiters_pages_components.id;


--
-- Name: recruiters_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recruiters_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recruiters_pages_id_seq OWNER TO postgres;

--
-- Name: recruiters_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recruiters_pages_id_seq OWNED BY public.recruiters_pages.id;


--
-- Name: recruiters_pages_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recruiters_pages_localizations_links (
    id integer NOT NULL,
    recruiters_page_id integer,
    inv_recruiters_page_id integer,
    recruiters_page_order double precision
);


ALTER TABLE public.recruiters_pages_localizations_links OWNER TO postgres;

--
-- Name: recruiters_pages_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recruiters_pages_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recruiters_pages_localizations_links_id_seq OWNER TO postgres;

--
-- Name: recruiters_pages_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recruiters_pages_localizations_links_id_seq OWNED BY public.recruiters_pages_localizations_links.id;


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
-- Name: uses_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uses_pages (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.uses_pages OWNER TO postgres;

--
-- Name: uses_pages_components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uses_pages_components (
    id integer NOT NULL,
    entity_id integer,
    component_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.uses_pages_components OWNER TO postgres;

--
-- Name: uses_pages_components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.uses_pages_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uses_pages_components_id_seq OWNER TO postgres;

--
-- Name: uses_pages_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uses_pages_components_id_seq OWNED BY public.uses_pages_components.id;


--
-- Name: uses_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.uses_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uses_pages_id_seq OWNER TO postgres;

--
-- Name: uses_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uses_pages_id_seq OWNED BY public.uses_pages.id;


--
-- Name: uses_pages_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uses_pages_localizations_links (
    id integer NOT NULL,
    uses_page_id integer,
    inv_uses_page_id integer,
    uses_page_order double precision
);


ALTER TABLE public.uses_pages_localizations_links OWNER TO postgres;

--
-- Name: uses_pages_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.uses_pages_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uses_pages_localizations_links_id_seq OWNER TO postgres;

--
-- Name: uses_pages_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uses_pages_localizations_links_id_seq OWNED BY public.uses_pages_localizations_links.id;


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
-- Name: components_shared_titled_paragraphs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_titled_paragraphs ALTER COLUMN id SET DEFAULT nextval('public.components_shared_titled_paragraphs_id_seq'::regclass);


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
-- Name: home_pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages ALTER COLUMN id SET DEFAULT nextval('public.home_pages_id_seq'::regclass);


--
-- Name: home_pages_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.home_pages_localizations_links_id_seq'::regclass);


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
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: projects_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.projects_localizations_links_id_seq'::regclass);


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
-- Name: recruiters_pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruiters_pages ALTER COLUMN id SET DEFAULT nextval('public.recruiters_pages_id_seq'::regclass);


--
-- Name: recruiters_pages_components id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruiters_pages_components ALTER COLUMN id SET DEFAULT nextval('public.recruiters_pages_components_id_seq'::regclass);


--
-- Name: recruiters_pages_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruiters_pages_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.recruiters_pages_localizations_links_id_seq'::regclass);


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
-- Name: uses_pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_pages ALTER COLUMN id SET DEFAULT nextval('public.uses_pages_id_seq'::regclass);


--
-- Name: uses_pages_components id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_pages_components ALTER COLUMN id SET DEFAULT nextval('public.uses_pages_components_id_seq'::regclass);


--
-- Name: uses_pages_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_pages_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.uses_pages_localizations_links_id_seq'::regclass);


--
-- Name: video_games id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video_games ALTER COLUMN id SET DEFAULT nextval('public.video_games_id_seq'::regclass);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (1, 'plugin::upload.read', NULL, '{}', '[]', '2023-08-13 18:13:24.318', '2023-08-13 18:13:24.318', NULL, NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (2, 'plugin::upload.configure-view', NULL, '{}', '[]', '2023-08-13 18:13:24.332', '2023-08-13 18:13:24.332', NULL, NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (3, 'plugin::upload.assets.create', NULL, '{}', '[]', '2023-08-13 18:13:24.341', '2023-08-13 18:13:24.341', NULL, NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (4, 'plugin::upload.assets.update', NULL, '{}', '[]', '2023-08-13 18:13:24.349', '2023-08-13 18:13:24.349', NULL, NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (5, 'plugin::upload.assets.download', NULL, '{}', '[]', '2023-08-13 18:13:24.357', '2023-08-13 18:13:24.357', NULL, NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (6, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2023-08-13 18:13:24.366', '2023-08-13 18:13:24.366', NULL, NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (7, 'plugin::upload.read', NULL, '{}', '["admin::is-creator"]', '2023-08-13 18:13:24.374', '2023-08-13 18:13:24.374', NULL, NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (8, 'plugin::upload.configure-view', NULL, '{}', '[]', '2023-08-13 18:13:24.382', '2023-08-13 18:13:24.382', NULL, NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (9, 'plugin::upload.assets.create', NULL, '{}', '[]', '2023-08-13 18:13:24.389', '2023-08-13 18:13:24.389', NULL, NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (10, 'plugin::upload.assets.update', NULL, '{}', '["admin::is-creator"]', '2023-08-13 18:13:24.396', '2023-08-13 18:13:24.396', NULL, NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (11, 'plugin::upload.assets.download', NULL, '{}', '[]', '2023-08-13 18:13:24.404', '2023-08-13 18:13:24.404', NULL, NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (12, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2023-08-13 18:13:24.411', '2023-08-13 18:13:24.411', NULL, NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (366, 'plugin::content-manager.explorer.create', 'api::recruiters-page.recruiters-page', '{"fields": ["jobPreferences.title", "jobPreferences.content", "jobPreferences.outro", "tldr.title", "tldr.content", "tldr.outro", "salary.title", "salary.content", "salary.outro", "toolsTechs.title", "toolsTechs.content", "toolsTechs.outro", "generalInfo.title", "generalInfo.content", "generalInfo.outro", "intro", "outro"], "locales": ["en", "de", "it"]}', '[]', '2023-10-21 09:00:15.805', '2023-10-21 09:00:15.805', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (367, 'plugin::content-manager.explorer.create', 'api::uses-page.uses-page', '{"fields": ["hardware.title", "hardware.content", "hardware.outro", "media.title", "media.content", "media.outro", "programmingTools.title", "programmingTools.content", "programmingTools.outro", "security.title", "security.content", "security.outro", "productivity.title", "productivity.content", "productivity.outro"], "locales": ["en", "de", "it"]}', '[]', '2023-10-21 09:00:15.818', '2023-10-21 09:00:15.818', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (368, 'plugin::content-manager.explorer.read', 'api::recruiters-page.recruiters-page', '{"fields": ["jobPreferences.title", "jobPreferences.content", "jobPreferences.outro", "tldr.title", "tldr.content", "tldr.outro", "salary.title", "salary.content", "salary.outro", "toolsTechs.title", "toolsTechs.content", "toolsTechs.outro", "generalInfo.title", "generalInfo.content", "generalInfo.outro", "intro", "outro"], "locales": ["en", "de", "it"]}', '[]', '2023-10-21 09:00:15.827', '2023-10-21 09:00:15.827', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (369, 'plugin::content-manager.explorer.read', 'api::uses-page.uses-page', '{"fields": ["hardware.title", "hardware.content", "hardware.outro", "media.title", "media.content", "media.outro", "programmingTools.title", "programmingTools.content", "programmingTools.outro", "security.title", "security.content", "security.outro", "productivity.title", "productivity.content", "productivity.outro"], "locales": ["en", "de", "it"]}', '[]', '2023-10-21 09:00:15.835', '2023-10-21 09:00:15.835', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (370, 'plugin::content-manager.explorer.update', 'api::recruiters-page.recruiters-page', '{"fields": ["jobPreferences.title", "jobPreferences.content", "jobPreferences.outro", "tldr.title", "tldr.content", "tldr.outro", "salary.title", "salary.content", "salary.outro", "toolsTechs.title", "toolsTechs.content", "toolsTechs.outro", "generalInfo.title", "generalInfo.content", "generalInfo.outro", "intro", "outro"], "locales": ["en", "de", "it"]}', '[]', '2023-10-21 09:00:15.843', '2023-10-21 09:00:15.843', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (371, 'plugin::content-manager.explorer.update', 'api::uses-page.uses-page', '{"fields": ["hardware.title", "hardware.content", "hardware.outro", "media.title", "media.content", "media.outro", "programmingTools.title", "programmingTools.content", "programmingTools.outro", "security.title", "security.content", "security.outro", "productivity.title", "productivity.content", "productivity.outro"], "locales": ["en", "de", "it"]}', '[]', '2023-10-21 09:00:15.851', '2023-10-21 09:00:15.851', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (372, 'plugin::content-manager.explorer.create', 'api::publication.publication', '{"fields": ["title", "description", "publisher", "year", "rank", "fileUrl"], "locales": ["en", "de", "it"]}', '[]', '2023-10-21 17:03:05.724', '2023-10-21 17:03:05.724', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (373, 'plugin::content-manager.explorer.read', 'api::publication.publication', '{"fields": ["title", "description", "publisher", "year", "rank", "fileUrl"], "locales": ["en", "de", "it"]}', '[]', '2023-10-21 17:03:05.736', '2023-10-21 17:03:05.736', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (374, 'plugin::content-manager.explorer.update', 'api::publication.publication', '{"fields": ["title", "description", "publisher", "year", "rank", "fileUrl"], "locales": ["en", "de", "it"]}', '[]', '2023-10-21 17:03:05.745', '2023-10-21 17:03:05.745', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (375, 'plugin::react-icons.read', NULL, '{}', '[]', '2023-10-31 19:10:08.409', '2023-10-31 19:10:08.409', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (342, 'admin::webhooks.update', NULL, '{}', '[]', '2023-10-03 19:30:03.448', '2023-10-03 19:30:03.448', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (343, 'admin::webhooks.delete', NULL, '{}', '[]', '2023-10-03 19:30:03.455', '2023-10-03 19:30:03.455', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (344, 'admin::users.create', NULL, '{}', '[]', '2023-10-03 19:30:03.462', '2023-10-03 19:30:03.462', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (345, 'admin::users.read', NULL, '{}', '[]', '2023-10-03 19:30:03.469', '2023-10-03 19:30:03.469', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (346, 'admin::users.update', NULL, '{}', '[]', '2023-10-03 19:30:03.476', '2023-10-03 19:30:03.476', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (347, 'admin::users.delete', NULL, '{}', '[]', '2023-10-03 19:30:03.485', '2023-10-03 19:30:03.485', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (348, 'admin::roles.create', NULL, '{}', '[]', '2023-10-03 19:30:03.491', '2023-10-03 19:30:03.491', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (349, 'admin::roles.read', NULL, '{}', '[]', '2023-10-03 19:30:03.498', '2023-10-03 19:30:03.498', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (350, 'admin::roles.update', NULL, '{}', '[]', '2023-10-03 19:30:03.505', '2023-10-03 19:30:03.505', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (351, 'admin::roles.delete', NULL, '{}', '[]', '2023-10-03 19:30:03.513', '2023-10-03 19:30:03.513', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (352, 'admin::api-tokens.access', NULL, '{}', '[]', '2023-10-03 19:30:03.522', '2023-10-03 19:30:03.522', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (353, 'admin::api-tokens.create', NULL, '{}', '[]', '2023-10-03 19:30:03.53', '2023-10-03 19:30:03.53', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (354, 'admin::api-tokens.read', NULL, '{}', '[]', '2023-10-03 19:30:03.538', '2023-10-03 19:30:03.538', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (355, 'admin::api-tokens.update', NULL, '{}', '[]', '2023-10-03 19:30:03.547', '2023-10-03 19:30:03.547', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (356, 'admin::api-tokens.regenerate', NULL, '{}', '[]', '2023-10-03 19:30:03.554', '2023-10-03 19:30:03.554', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (357, 'admin::api-tokens.delete', NULL, '{}', '[]', '2023-10-03 19:30:03.562', '2023-10-03 19:30:03.562', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (358, 'admin::project-settings.update', NULL, '{}', '[]', '2023-10-03 19:30:03.571', '2023-10-03 19:30:03.571', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (359, 'admin::project-settings.read', NULL, '{}', '[]', '2023-10-03 19:30:03.58', '2023-10-03 19:30:03.58', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (360, 'admin::transfer.tokens.access', NULL, '{}', '[]', '2023-10-03 19:30:03.589', '2023-10-03 19:30:03.589', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (361, 'admin::transfer.tokens.create', NULL, '{}', '[]', '2023-10-03 19:30:03.596', '2023-10-03 19:30:03.596', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (362, 'admin::transfer.tokens.read', NULL, '{}', '[]', '2023-10-03 19:30:03.604', '2023-10-03 19:30:03.604', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (363, 'admin::transfer.tokens.update', NULL, '{}', '[]', '2023-10-03 19:30:03.611', '2023-10-03 19:30:03.611', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (364, 'admin::transfer.tokens.regenerate', NULL, '{}', '[]', '2023-10-03 19:30:03.617', '2023-10-03 19:30:03.617', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (365, 'admin::transfer.tokens.delete', NULL, '{}', '[]', '2023-10-03 19:30:03.624', '2023-10-03 19:30:03.624', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (221, 'plugin::content-manager.explorer.create', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}', '[]', '2023-10-03 19:30:02.529', '2023-10-03 19:30:02.529', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (222, 'plugin::content-manager.explorer.create', 'api::book.book', '{"fields": ["title", "author", "cover", "goodreadsLink", "genre", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.542', '2023-10-03 19:30:02.542', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (223, 'plugin::content-manager.explorer.create', 'api::code-snippet.code-snippet', '{"fields": ["language", "code"]}', '[]', '2023-10-03 19:30:02.551', '2023-10-03 19:30:02.551', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (224, 'plugin::content-manager.explorer.create', 'api::home-page.home-page', '{"fields": ["greeting", "introduction_1", "introduction_2", "introduction_3", "introduction_4", "introduction_5"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.561', '2023-10-03 19:30:02.561', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (225, 'plugin::content-manager.explorer.create', 'api::job.job', '{"fields": ["companyName", "icon", "title", "location", "startDate", "endDate", "isCurrentJob", "description", "mainColor", "darkColor", "technologies"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.57', '2023-10-03 19:30:02.57', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (226, 'plugin::content-manager.explorer.create', 'api::language.language', '{"fields": ["name", "level", "flag", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.58', '2023-10-03 19:30:02.58', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (227, 'plugin::content-manager.explorer.create', 'api::podcast.podcast', '{"fields": ["name", "author", "language", "cover", "mediaLink"]}', '[]', '2023-10-03 19:30:02.59', '2023-10-03 19:30:02.59', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (228, 'plugin::content-manager.explorer.create', 'api::project.project', '{"fields": ["title", "image", "shortDescription", "tools", "date", "tags", "links", "longDescription"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.597', '2023-10-03 19:30:02.597', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (230, 'plugin::content-manager.explorer.create', 'api::random-fact.random-fact', '{"fields": ["name", "headline", "description", "isFactTrue", "explanation"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.612', '2023-10-03 19:30:02.612', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (232, 'plugin::content-manager.explorer.create', 'api::school.school', '{"fields": ["schoolName", "flag", "degreeName", "degreeUrl", "grade", "start", "end", "description", "icon"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.627', '2023-10-03 19:30:02.627', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (233, 'plugin::content-manager.explorer.create', 'api::skill.skill', '{"fields": ["title", "description", "icons", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.634', '2023-10-03 19:30:02.634', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (234, 'plugin::content-manager.explorer.create', 'api::software-development-intro.software-development-intro', '{"fields": ["title", "content", "icon"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.642', '2023-10-03 19:30:02.642', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (235, 'plugin::content-manager.explorer.create', 'api::tv-show.tv-show', '{"fields": ["title", "poster", "link", "year"]}', '[]', '2023-10-03 19:30:02.65', '2023-10-03 19:30:02.65', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (237, 'plugin::content-manager.explorer.create', 'api::video-game.video-game', '{"fields": ["title", "cover", "link", "year"]}', '[]', '2023-10-03 19:30:02.663', '2023-10-03 19:30:02.663', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (238, 'plugin::content-manager.explorer.read', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}', '[]', '2023-10-03 19:30:02.67', '2023-10-03 19:30:02.67', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (239, 'plugin::content-manager.explorer.read', 'api::book.book', '{"fields": ["title", "author", "cover", "goodreadsLink", "genre", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.679', '2023-10-03 19:30:02.679', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (240, 'plugin::content-manager.explorer.read', 'api::code-snippet.code-snippet', '{"fields": ["language", "code"]}', '[]', '2023-10-03 19:30:02.686', '2023-10-03 19:30:02.686', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (241, 'plugin::content-manager.explorer.read', 'api::home-page.home-page', '{"fields": ["greeting", "introduction_1", "introduction_2", "introduction_3", "introduction_4", "introduction_5"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.693', '2023-10-03 19:30:02.693', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (242, 'plugin::content-manager.explorer.read', 'api::job.job', '{"fields": ["companyName", "icon", "title", "location", "startDate", "endDate", "isCurrentJob", "description", "mainColor", "darkColor", "technologies"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.701', '2023-10-03 19:30:02.701', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (243, 'plugin::content-manager.explorer.read', 'api::language.language', '{"fields": ["name", "level", "flag", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.708', '2023-10-03 19:30:02.708', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (244, 'plugin::content-manager.explorer.read', 'api::podcast.podcast', '{"fields": ["name", "author", "language", "cover", "mediaLink"]}', '[]', '2023-10-03 19:30:02.716', '2023-10-03 19:30:02.716', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (245, 'plugin::content-manager.explorer.read', 'api::project.project', '{"fields": ["title", "image", "shortDescription", "tools", "date", "tags", "links", "longDescription"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.724', '2023-10-03 19:30:02.724', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (247, 'plugin::content-manager.explorer.read', 'api::random-fact.random-fact', '{"fields": ["name", "headline", "description", "isFactTrue", "explanation"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.739', '2023-10-03 19:30:02.739', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (249, 'plugin::content-manager.explorer.read', 'api::school.school', '{"fields": ["schoolName", "flag", "degreeName", "degreeUrl", "grade", "start", "end", "description", "icon"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.754', '2023-10-03 19:30:02.754', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (250, 'plugin::content-manager.explorer.read', 'api::skill.skill', '{"fields": ["title", "description", "icons", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.761', '2023-10-03 19:30:02.761', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (251, 'plugin::content-manager.explorer.read', 'api::software-development-intro.software-development-intro', '{"fields": ["title", "content", "icon"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.768', '2023-10-03 19:30:02.768', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (252, 'plugin::content-manager.explorer.read', 'api::tv-show.tv-show', '{"fields": ["title", "poster", "link", "year"]}', '[]', '2023-10-03 19:30:02.776', '2023-10-03 19:30:02.776', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (254, 'plugin::content-manager.explorer.read', 'api::video-game.video-game', '{"fields": ["title", "cover", "link", "year"]}', '[]', '2023-10-03 19:30:02.79', '2023-10-03 19:30:02.79', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (255, 'plugin::content-manager.explorer.update', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}', '[]', '2023-10-03 19:30:02.796', '2023-10-03 19:30:02.796', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (256, 'plugin::content-manager.explorer.update', 'api::book.book', '{"fields": ["title", "author", "cover", "goodreadsLink", "genre", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.804', '2023-10-03 19:30:02.804', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (257, 'plugin::content-manager.explorer.update', 'api::code-snippet.code-snippet', '{"fields": ["language", "code"]}', '[]', '2023-10-03 19:30:02.813', '2023-10-03 19:30:02.813', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (258, 'plugin::content-manager.explorer.update', 'api::home-page.home-page', '{"fields": ["greeting", "introduction_1", "introduction_2", "introduction_3", "introduction_4", "introduction_5"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.821', '2023-10-03 19:30:02.821', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (259, 'plugin::content-manager.explorer.update', 'api::job.job', '{"fields": ["companyName", "icon", "title", "location", "startDate", "endDate", "isCurrentJob", "description", "mainColor", "darkColor", "technologies"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.828', '2023-10-03 19:30:02.828', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (260, 'plugin::content-manager.explorer.update', 'api::language.language', '{"fields": ["name", "level", "flag", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.836', '2023-10-03 19:30:02.836', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (261, 'plugin::content-manager.explorer.update', 'api::podcast.podcast', '{"fields": ["name", "author", "language", "cover", "mediaLink"]}', '[]', '2023-10-03 19:30:02.843', '2023-10-03 19:30:02.843', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (262, 'plugin::content-manager.explorer.update', 'api::project.project', '{"fields": ["title", "image", "shortDescription", "tools", "date", "tags", "links", "longDescription"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.85', '2023-10-03 19:30:02.85', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (264, 'plugin::content-manager.explorer.update', 'api::random-fact.random-fact', '{"fields": ["name", "headline", "description", "isFactTrue", "explanation"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.864', '2023-10-03 19:30:02.864', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (266, 'plugin::content-manager.explorer.update', 'api::school.school', '{"fields": ["schoolName", "flag", "degreeName", "degreeUrl", "grade", "start", "end", "description", "icon"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.878', '2023-10-03 19:30:02.878', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (267, 'plugin::content-manager.explorer.update', 'api::skill.skill', '{"fields": ["title", "description", "icons", "rank"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.887', '2023-10-03 19:30:02.887', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (268, 'plugin::content-manager.explorer.update', 'api::software-development-intro.software-development-intro', '{"fields": ["title", "content", "icon"], "locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.895', '2023-10-03 19:30:02.895', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (269, 'plugin::content-manager.explorer.update', 'api::tv-show.tv-show', '{"fields": ["title", "poster", "link", "year"]}', '[]', '2023-10-03 19:30:02.902', '2023-10-03 19:30:02.902', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (271, 'plugin::content-manager.explorer.update', 'api::video-game.video-game', '{"fields": ["title", "cover", "link", "year"]}', '[]', '2023-10-03 19:30:02.917', '2023-10-03 19:30:02.917', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (272, 'plugin::content-manager.explorer.delete', 'plugin::users-permissions.user', '{}', '[]', '2023-10-03 19:30:02.925', '2023-10-03 19:30:02.925', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (273, 'plugin::content-manager.explorer.delete', 'api::book.book', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.933', '2023-10-03 19:30:02.933', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (274, 'plugin::content-manager.explorer.delete', 'api::code-snippet.code-snippet', '{}', '[]', '2023-10-03 19:30:02.942', '2023-10-03 19:30:02.942', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (275, 'plugin::content-manager.explorer.delete', 'api::home-page.home-page', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.949', '2023-10-03 19:30:02.949', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (276, 'plugin::content-manager.explorer.delete', 'api::job.job', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.957', '2023-10-03 19:30:02.957', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (277, 'plugin::content-manager.explorer.delete', 'api::language.language', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.965', '2023-10-03 19:30:02.965', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (278, 'plugin::content-manager.explorer.delete', 'api::podcast.podcast', '{}', '[]', '2023-10-03 19:30:02.972', '2023-10-03 19:30:02.972', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (279, 'plugin::content-manager.explorer.delete', 'api::project.project', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.98', '2023-10-03 19:30:02.98', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (280, 'plugin::content-manager.explorer.delete', 'api::publication.publication', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.987', '2023-10-03 19:30:02.987', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (281, 'plugin::content-manager.explorer.delete', 'api::random-fact.random-fact', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:02.995', '2023-10-03 19:30:02.995', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (282, 'plugin::content-manager.explorer.delete', 'api::recruiters-page.recruiters-page', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.002', '2023-10-03 19:30:03.002', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (283, 'plugin::content-manager.explorer.delete', 'api::school.school', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.01', '2023-10-03 19:30:03.01', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (284, 'plugin::content-manager.explorer.delete', 'api::skill.skill', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.017', '2023-10-03 19:30:03.017', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (285, 'plugin::content-manager.explorer.delete', 'api::software-development-intro.software-development-intro', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.025', '2023-10-03 19:30:03.025', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (286, 'plugin::content-manager.explorer.delete', 'api::tv-show.tv-show', '{}', '[]', '2023-10-03 19:30:03.032', '2023-10-03 19:30:03.032', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (287, 'plugin::content-manager.explorer.delete', 'api::uses-page.uses-page', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.039', '2023-10-03 19:30:03.039', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (288, 'plugin::content-manager.explorer.delete', 'api::video-game.video-game', '{}', '[]', '2023-10-03 19:30:03.047', '2023-10-03 19:30:03.047', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (289, 'plugin::content-manager.explorer.publish', 'api::book.book', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.055', '2023-10-03 19:30:03.055', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (290, 'plugin::content-manager.explorer.publish', 'api::code-snippet.code-snippet', '{}', '[]', '2023-10-03 19:30:03.062', '2023-10-03 19:30:03.062', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (291, 'plugin::content-manager.explorer.publish', 'api::home-page.home-page', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.069', '2023-10-03 19:30:03.069', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (292, 'plugin::content-manager.explorer.publish', 'api::job.job', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.076', '2023-10-03 19:30:03.076', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (293, 'plugin::content-manager.explorer.publish', 'api::language.language', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.085', '2023-10-03 19:30:03.085', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (294, 'plugin::content-manager.explorer.publish', 'api::podcast.podcast', '{}', '[]', '2023-10-03 19:30:03.092', '2023-10-03 19:30:03.092', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (295, 'plugin::content-manager.explorer.publish', 'api::project.project', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.099', '2023-10-03 19:30:03.099', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (296, 'plugin::content-manager.explorer.publish', 'api::publication.publication', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.108', '2023-10-03 19:30:03.108', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (297, 'plugin::content-manager.explorer.publish', 'api::random-fact.random-fact', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.116', '2023-10-03 19:30:03.116', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (298, 'plugin::content-manager.explorer.publish', 'api::recruiters-page.recruiters-page', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.125', '2023-10-03 19:30:03.125', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (299, 'plugin::content-manager.explorer.publish', 'api::school.school', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.133', '2023-10-03 19:30:03.133', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (300, 'plugin::content-manager.explorer.publish', 'api::skill.skill', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.141', '2023-10-03 19:30:03.141', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (301, 'plugin::content-manager.explorer.publish', 'api::software-development-intro.software-development-intro', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.149', '2023-10-03 19:30:03.149', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (302, 'plugin::content-manager.explorer.publish', 'api::tv-show.tv-show', '{}', '[]', '2023-10-03 19:30:03.157', '2023-10-03 19:30:03.157', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (303, 'plugin::content-manager.explorer.publish', 'api::uses-page.uses-page', '{"locales": ["en", "de", "it"]}', '[]', '2023-10-03 19:30:03.164', '2023-10-03 19:30:03.164', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (304, 'plugin::content-manager.explorer.publish', 'api::video-game.video-game', '{}', '[]', '2023-10-03 19:30:03.173', '2023-10-03 19:30:03.173', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (305, 'plugin::content-manager.single-types.configure-view', NULL, '{}', '[]', '2023-10-03 19:30:03.179', '2023-10-03 19:30:03.179', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (306, 'plugin::content-manager.collection-types.configure-view', NULL, '{}', '[]', '2023-10-03 19:30:03.186', '2023-10-03 19:30:03.186', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (307, 'plugin::content-manager.components.configure-layout', NULL, '{}', '[]', '2023-10-03 19:30:03.193', '2023-10-03 19:30:03.193', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (308, 'plugin::content-type-builder.read', NULL, '{}', '[]', '2023-10-03 19:30:03.2', '2023-10-03 19:30:03.2', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (309, 'plugin::email.settings.read', NULL, '{}', '[]', '2023-10-03 19:30:03.207', '2023-10-03 19:30:03.207', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (310, 'plugin::upload.read', NULL, '{}', '[]', '2023-10-03 19:30:03.214', '2023-10-03 19:30:03.214', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (311, 'plugin::upload.assets.create', NULL, '{}', '[]', '2023-10-03 19:30:03.22', '2023-10-03 19:30:03.22', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (312, 'plugin::upload.assets.update', NULL, '{}', '[]', '2023-10-03 19:30:03.227', '2023-10-03 19:30:03.227', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (313, 'plugin::upload.assets.download', NULL, '{}', '[]', '2023-10-03 19:30:03.234', '2023-10-03 19:30:03.234', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (314, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2023-10-03 19:30:03.241', '2023-10-03 19:30:03.241', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (315, 'plugin::upload.configure-view', NULL, '{}', '[]', '2023-10-03 19:30:03.248', '2023-10-03 19:30:03.248', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (316, 'plugin::upload.settings.read', NULL, '{}', '[]', '2023-10-03 19:30:03.255', '2023-10-03 19:30:03.255', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (317, 'plugin::import-export-entries.import', NULL, '{}', '[]', '2023-10-03 19:30:03.262', '2023-10-03 19:30:03.262', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (318, 'plugin::import-export-entries.export', NULL, '{}', '[]', '2023-10-03 19:30:03.269', '2023-10-03 19:30:03.269', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (320, 'plugin::documentation.read', NULL, '{}', '[]', '2023-10-03 19:30:03.283', '2023-10-03 19:30:03.283', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (321, 'plugin::documentation.settings.update', NULL, '{}', '[]', '2023-10-03 19:30:03.291', '2023-10-03 19:30:03.291', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (322, 'plugin::documentation.settings.regenerate', NULL, '{}', '[]', '2023-10-03 19:30:03.298', '2023-10-03 19:30:03.298', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (323, 'plugin::documentation.settings.read', NULL, '{}', '[]', '2023-10-03 19:30:03.305', '2023-10-03 19:30:03.305', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (324, 'plugin::i18n.locale.create', NULL, '{}', '[]', '2023-10-03 19:30:03.313', '2023-10-03 19:30:03.313', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (325, 'plugin::i18n.locale.read', NULL, '{}', '[]', '2023-10-03 19:30:03.32', '2023-10-03 19:30:03.32', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (326, 'plugin::i18n.locale.update', NULL, '{}', '[]', '2023-10-03 19:30:03.328', '2023-10-03 19:30:03.328', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (327, 'plugin::i18n.locale.delete', NULL, '{}', '[]', '2023-10-03 19:30:03.335', '2023-10-03 19:30:03.335', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (328, 'plugin::seo.read', NULL, '{}', '[]', '2023-10-03 19:30:03.344', '2023-10-03 19:30:03.344', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (329, 'plugin::users-permissions.roles.create', NULL, '{}', '[]', '2023-10-03 19:30:03.351', '2023-10-03 19:30:03.351', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (330, 'plugin::users-permissions.roles.read', NULL, '{}', '[]', '2023-10-03 19:30:03.358', '2023-10-03 19:30:03.358', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (331, 'plugin::users-permissions.roles.update', NULL, '{}', '[]', '2023-10-03 19:30:03.365', '2023-10-03 19:30:03.365', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (332, 'plugin::users-permissions.roles.delete', NULL, '{}', '[]', '2023-10-03 19:30:03.373', '2023-10-03 19:30:03.373', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (333, 'plugin::users-permissions.providers.read', NULL, '{}', '[]', '2023-10-03 19:30:03.381', '2023-10-03 19:30:03.381', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (334, 'plugin::users-permissions.providers.update', NULL, '{}', '[]', '2023-10-03 19:30:03.388', '2023-10-03 19:30:03.388', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (335, 'plugin::users-permissions.email-templates.read', NULL, '{}', '[]', '2023-10-03 19:30:03.395', '2023-10-03 19:30:03.395', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (336, 'plugin::users-permissions.email-templates.update', NULL, '{}', '[]', '2023-10-03 19:30:03.402', '2023-10-03 19:30:03.402', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (337, 'plugin::users-permissions.advanced-settings.read', NULL, '{}', '[]', '2023-10-03 19:30:03.41', '2023-10-03 19:30:03.41', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (338, 'plugin::users-permissions.advanced-settings.update', NULL, '{}', '[]', '2023-10-03 19:30:03.418', '2023-10-03 19:30:03.418', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (339, 'admin::marketplace.read', NULL, '{}', '[]', '2023-10-03 19:30:03.426', '2023-10-03 19:30:03.426', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (340, 'admin::webhooks.create', NULL, '{}', '[]', '2023-10-03 19:30:03.434', '2023-10-03 19:30:03.434', NULL, NULL, '{}');
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id, action_parameters) VALUES (341, 'admin::webhooks.read', NULL, '{}', '[]', '2023-10-03 19:30:03.441', '2023-10-03 19:30:03.441', NULL, NULL, '{}');


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
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (376, 366, 1, 146);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (377, 367, 1, 147);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (378, 368, 1, 148);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (379, 369, 1, 149);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (380, 370, 1, 150);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (381, 371, 1, 151);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (385, 375, 1, 155);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (382, 372, 1, 152);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (383, 373, 1, 153);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (384, 374, 1, 154);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (231, 221, 1, 1);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (232, 222, 1, 2);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (233, 223, 1, 3);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (234, 224, 1, 4);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (235, 225, 1, 5);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (236, 226, 1, 6);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (237, 227, 1, 7);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (238, 228, 1, 8);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (240, 230, 1, 10);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (242, 232, 1, 12);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (243, 233, 1, 13);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (244, 234, 1, 14);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (245, 235, 1, 15);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (247, 237, 1, 17);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (248, 238, 1, 18);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (249, 239, 1, 19);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (250, 240, 1, 20);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (251, 241, 1, 21);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (252, 242, 1, 22);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (253, 243, 1, 23);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (254, 244, 1, 24);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (255, 245, 1, 25);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (257, 247, 1, 27);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (259, 249, 1, 29);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (260, 250, 1, 30);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (261, 251, 1, 31);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (262, 252, 1, 32);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (264, 254, 1, 34);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (265, 255, 1, 35);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (266, 256, 1, 36);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (267, 257, 1, 37);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (268, 258, 1, 38);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (269, 259, 1, 39);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (270, 260, 1, 40);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (271, 261, 1, 41);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (272, 262, 1, 42);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (274, 264, 1, 44);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (276, 266, 1, 46);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (277, 267, 1, 47);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (278, 268, 1, 48);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (279, 269, 1, 49);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (281, 271, 1, 51);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (282, 272, 1, 52);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (283, 273, 1, 53);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (284, 274, 1, 54);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (285, 275, 1, 55);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (286, 276, 1, 56);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (287, 277, 1, 57);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (288, 278, 1, 58);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (289, 279, 1, 59);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (290, 280, 1, 60);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (291, 281, 1, 61);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (292, 282, 1, 62);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (293, 283, 1, 63);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (294, 284, 1, 64);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (295, 285, 1, 65);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (296, 286, 1, 66);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (297, 287, 1, 67);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (298, 288, 1, 68);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (299, 289, 1, 69);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (300, 290, 1, 70);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (301, 291, 1, 71);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (302, 292, 1, 72);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (303, 293, 1, 73);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (304, 294, 1, 74);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (305, 295, 1, 75);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (306, 296, 1, 76);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (307, 297, 1, 77);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (308, 298, 1, 78);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (309, 299, 1, 79);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (310, 300, 1, 80);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (311, 301, 1, 81);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (312, 302, 1, 82);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (313, 303, 1, 83);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (314, 304, 1, 84);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (315, 305, 1, 85);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (316, 306, 1, 86);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (317, 307, 1, 87);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (318, 308, 1, 88);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (319, 309, 1, 89);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (320, 310, 1, 90);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (321, 311, 1, 91);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (322, 312, 1, 92);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (323, 313, 1, 93);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (324, 314, 1, 94);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (325, 315, 1, 95);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (326, 316, 1, 96);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (327, 317, 1, 97);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (328, 318, 1, 98);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (330, 320, 1, 100);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (331, 321, 1, 101);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (332, 322, 1, 102);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (333, 323, 1, 103);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (334, 324, 1, 104);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (335, 325, 1, 105);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (336, 326, 1, 106);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (337, 327, 1, 107);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (338, 328, 1, 108);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (339, 329, 1, 109);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (340, 330, 1, 110);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (341, 331, 1, 111);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (342, 332, 1, 112);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (343, 333, 1, 113);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (344, 334, 1, 114);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (345, 335, 1, 115);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (346, 336, 1, 116);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (347, 337, 1, 117);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (348, 338, 1, 118);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (349, 339, 1, 119);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (350, 340, 1, 120);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (351, 341, 1, 121);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (352, 342, 1, 122);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (353, 343, 1, 123);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (354, 344, 1, 124);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (355, 345, 1, 125);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (356, 346, 1, 126);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (357, 347, 1, 127);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (358, 348, 1, 128);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (359, 349, 1, 129);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (360, 350, 1, 130);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (361, 351, 1, 131);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (362, 352, 1, 132);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (363, 353, 1, 133);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (364, 354, 1, 134);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (365, 355, 1, 135);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (366, 356, 1, 136);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (367, 357, 1, 137);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (368, 358, 1, 138);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (369, 359, 1, 139);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (370, 360, 1, 140);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (371, 361, 1, 141);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (372, 362, 1, 142);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (373, 363, 1, 143);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (374, 364, 1, 144);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (375, 365, 1, 145);


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
INSERT INTO public.books (id, title, author, goodreads_link, genre, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (9, 'The Pragmatic Programmer', 'Hunt, Andrew and Thomas, David', 'https://www.goodreads.com/book/show/4099.The_Pragmatic_Programmer', 'Non-fiction', '2023-08-23 14:01:35.187', '2023-09-14 14:10:12.354', '2023-08-23 14:01:36.206', 1, 1, 'en', NULL);


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
INSERT INTO public.code_snippets (id, code, language, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (6, 'marta_pancaldi = SoftwareEngineer(
    role=''Software Engineer'',
    skills=[''Java'', ''Python'', ''NodeJS''],
    age=pow(2, 4) + 3 * 5 - math.sqrt(9)
)', 'Python', '2023-08-24 15:12:51.769', '2023-10-27 18:34:24.632', '2023-08-24 15:12:53.037', 1, 1);
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
-- Data for Name: components_shared_titled_paragraphs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (1, 'Job Preferences', '- **Fully remote only**.
    - Infrequent onsite visits (say 1-2 per quarter) are fine.
- I will be working from Italy, thus as an Italian tax resident
    
    Options that I’m aware of for the above are:
    
    - The company is based in Italy, or has a tax entity in the Italian territory
    - Use of an EoR platform, such as [Remote.com](http://Remote.com) or Deel
    - Hiring me as a contractor / freelancer
- Preferably within **EMEA** to align with timezones
    - Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well
    - Eligible to work in the EU (Italian citizenship) and the UK (Settled Status)

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (34, 'TL;DR', '🏡 Remote-first position. (Infrequent visits to the office, say 1-2 per quarter, are fine.)

🇮🇹 Italian resident employment. (Preferably in EMEA to align with timezones, but willing to consider any location. Additionally, I have the right to work in the UK thanks to my acquired "[Settled Status](https://www.gov.uk/settled-status-eu-citizens-families)".)

🖋️ Permanent or Contract.

⚙️ Ideally full-stack or backend-focused.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (35, 'Setting the Stage: Salary Expectations', 'Let''s talk money, shall we? While it''s not the job search holy grail, it does matter. As much as I''d love to pay my bills with passion and dedication, unfortunately that''s not how the world works 😉💰

I get to the point: if the salary doesn''t align, I respectfully move on. It''s all about clarity, respect, and efficiency 😊👍💼

I came up with this fun little tool to help you get a sense of what I''m aiming for in my next role. The numbers aren''t etched in stone, but it''s a cool way to kick things off 🎉', '<details>
  <summary>Are you Italian and/or these numbers look insane to you? 🙀</summary>
  
I completely understand. Being an Italian myself, I know all too well the challenges and relatively lower salaries that many professionals, including software engineers, contend with in our Bel Paese. But, here''s the deal: the numbers I''m putting out there are on par with the European salary averages. 

I firmly believe in fair compensation for the value I bring to the table. My goal is to secure a salary that truly reflects my skills and experience without any compromises. This is my little way of pushing for a change. 🚀💪🇮🇹
</details>');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (36, 'Tools & Technologies', '#### 🟢  Preferred technologies: \*

- Java, Spring Boot
- Kotlin
- Javascript / Typescript
- React / Angular / Vue
- NodeJS
- REST APIs / GraphQL
- MySQL / Postgres / MongoDB

#### 🟡  I’m not too experienced / familiar with, but I’m willing to consider:

- Python
- C#, .NET
- Go
- Swift, iOS development

#### 🔴  I’d rather not work with:

- PHP
- C / C++
- roles largely focused on infrastructure / DevOps

\* have a look at my [cv](/cv) and [projects](/projects) pages to get a better idea of the work experience I have had and the projects I have been involved in.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (63, '🎯 Productivity', '**Notion**, for organizing my notes

**Obsidian**, as a second brain

Slack

Discord

**Telegram**: do people really still use Whatsapp?

**Microsoft To Do**, basically for organizing my life

**GoodReads** for keeping track of the books I read

**Google Play Books** for syncing ebooks across devices

DeepL

**[XBar](https://xbarapp.com/)**: put anything in my MacOS menu bar

**[Raindrop.io](https://raindrop.io/)** for organizing my (way too many) online bookmarks

**Pinterest**, for gathering ideas and finding inspiration about any topic', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (14, 'Job Preferences', '**Fully remote only**.

- Infrequent onsite visits (say 1-2 per quarter) are fine.

I will be working from Italy, thus as an Italian tax resident
    
Options that I’m aware of for the above are:
    
- The company is based in Italy, or has a tax entity in the Italian territory
- Use of an EoR platform, such as [Remote.com](http://Remote.com) or Deel
- Hiring me as a contractor / freelancer

Preferably within **EMEA** to align with timezones
- Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well
- Eligible to work in the EU (Italian citizenship) and the UK (Settled Status)

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (10, 'Job Preferences', '**Fully remote only**.

- Infrequent onsite visits (say 1-2 per quarter) are fine.

I will be working from Italy, thus as an Italian tax resident
    
Options that I’m aware of for the above are:
    
- The company is based in Italy, or has a tax entity in the Italian territory
- Use of an EoR platform, such as [Remote.com](http://Remote.com) or Deel
- Hiring me as a contractor / freelancer

Preferably within **EMEA** to align with timezones
- Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well
- Eligible to work in the EU (Italian citizenship) and the UK (Settled Status)

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (11, 'Job Preferences', '**Fully remote only**.

- Infrequent onsite visits (say 1-2 per quarter) are fine.

I will be working from Italy, thus as an Italian tax resident
    
Options that I’m aware of for the above are:
    
- The company is based in Italy, or has a tax entity in the Italian territory
- Use of an EoR platform, such as [Remote.com](http://Remote.com) or Deel
- Hiring me as a contractor / freelancer

Preferably within **EMEA** to align with timezones
- Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well
- Eligible to work in the EU (Italian citizenship) and the UK (Settled Status)

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (12, 'Job Preferences', '**Fully remote only**.

- Infrequent onsite visits (say 1-2 per quarter) are fine.

I will be working from Italy, thus as an Italian tax resident
    
Options that I’m aware of for the above are:
    
- The company is based in Italy, or has a tax entity in the Italian territory
- Use of an EoR platform, such as [Remote.com](http://Remote.com) or Deel
- Hiring me as a contractor / freelancer

Preferably within **EMEA** to align with timezones
- Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well
- Eligible to work in the EU (Italian citizenship) and the UK (Settled Status)

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (13, 'Job Preferences', '**Fully remote only**.

- Infrequent onsite visits (say 1-2 per quarter) are fine.

I will be working from Italy, thus as an Italian tax resident
    
Options that I’m aware of for the above are:
    
- The company is based in Italy, or has a tax entity in the Italian territory
- Use of an EoR platform, such as [Remote.com](http://Remote.com) or Deel
- Hiring me as a contractor / freelancer

Preferably within **EMEA** to align with timezones
- Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well
- Eligible to work in the EU (Italian citizenship) and the UK (Settled Status)

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (15, 'Job Preferences', '**Fully remote only**.

- Infrequent onsite visits (say 1-2 per quarter) are fine.

I will be working from Italy, thus as an Italian tax resident
    
Options that I’m aware of for the above are:
    
- The company is based in Italy, or has a tax entity in the Italian territory
- Use of an EoR platform, such as [Remote.com](http://Remote.com) or Deel
- Hiring me as a contractor / freelancer

Preferably within **EMEA** to align with timezones
- Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well
- Eligible to work in the EU (Italian citizenship) and the UK (Settled Status)

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (16, 'TL;DR', '- 🏡 Remote-first position. (Infrequent visits to the office, say 1-2 per quarter, are fine.)
- 🇮🇹 Italian resident employment. (Preferably in EMEA to align with timezones, but willing to consider any location. Additionally, I have the right to work in the UK thanks to my "Settled Status".)
- 🖋️ Permanent or Contract.
- ⚙️ Ideally full-stack or backend-focused.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (50, 'TL;DR', '🏡 Remote-first position. (Infrequent visits to the office, say 1-2 per quarter, are fine.)

🇮🇹 Italian resident employment. (Preferably in EMEA to align with timezones, but willing to consider any location. Additionally, I have the right to work in the UK thanks to my acquired "[Settled Status](https://www.gov.uk/settled-status-eu-citizens-families)".)

🖋️ Permanent or Contract.

⚙️ Ideally full-stack or backend-focused.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (17, 'Job Preferences', '**Fully remote only**.

- Infrequent onsite visits (say 1-2 per quarter) are fine.

I will be working from Italy, thus as an Italian tax resident
    
Options that I’m aware of for the above are:
    
- The company is based in Italy, or has a tax entity in the Italian territory
- Use of an EoR platform, such as [Remote.com](http://Remote.com) or Deel
- Hiring me as a contractor / freelancer

Preferably within **EMEA** to align with timezones
- Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well
- Eligible to work in the EU (Italian citizenship) and the UK (Settled Status)

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (18, 'TL;DR', '- 🏡 Remote-first position. (Infrequent visits to the office, say 1-2 per quarter, are fine.)
- 🇮🇹 Italian resident employment. (Preferably in EMEA to align with timezones, but willing to consider any location. Additionally, I have the right to work in the UK thanks to my "Settled Status".)
- 🖋️ Permanent or Contract.
- ⚙️ Ideally full-stack or backend-focused.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (19, 'Setting the Stage: Salary Expectations', 'Let''s talk money, shall we? While it''s not the job search holy grail, it does matter. As much as I''d love to pay my bills with passion, that''s not how the world works 😉💰

I get to the point: if the salary doesn''t align, I respectfully move on. It''s all about clarity, respect, and efficiency 😊👍💼

I came up with this fun little tool to help you get a sense of what I''m aiming for in my next role. The numbers aren''t etched in stone, but it''s a cool way to kick things off 🎉', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (23, 'Job Preferences', '**Fully remote only**.

- Infrequent onsite visits (say 1-2 per quarter) are fine.

I will be working from Italy, thus as an Italian tax resident
    
Options that I’m aware of for the above are:
    
- The company is based in Italy, or has a tax entity in the Italian territory
- Use of an EoR platform, such as [Remote.com](http://Remote.com) or Deel
- Hiring me as a contractor / freelancer

Preferably within **EMEA** to align with timezones
- Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well
- Eligible to work in the EU (Italian citizenship) and the UK (Settled Status)

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (24, 'TL;DR', '- 🏡 Remote-first position. (Infrequent visits to the office, say 1-2 per quarter, are fine.)
- 🇮🇹 Italian resident employment. (Preferably in EMEA to align with timezones, but willing to consider any location. Additionally, I have the right to work in the UK thanks to my "Settled Status".)
- 🖋️ Permanent or Contract.
- ⚙️ Ideally full-stack or backend-focused.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (25, 'Setting the Stage: Salary Expectations', 'Let''s talk money, shall we? While it''s not the job search holy grail, it does matter. As much as I''d love to pay my bills with passion, that''s not how the world works 😉💰

I get to the point: if the salary doesn''t align, I respectfully move on. It''s all about clarity, respect, and efficiency 😊👍💼

I came up with this fun little tool to help you get a sense of what I''m aiming for in my next role. The numbers aren''t etched in stone, but it''s a cool way to kick things off 🎉', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (26, 'Tools & Technologies', '#### 🟢  Preferred technologies: \*

- Java, Spring Boot
- Kotlin
- Javascript / Typescript
- React / Angular / Vue
- NodeJS
- REST APIs / GraphQL
- MySQL / Postgres / MongoDB

#### 🟡  I’m not too experienced / familiar with, but I’m willing to consider:

- Python
- C#, .NET
- Go
- Swift, iOS development

#### 🔴  I’d rather not work with:

- PHP
- C / C++
- roles largely focused on infrastructure / DevOps

\* have a look at my [cv](/cv) and [projects](/projects) pages to get a better idea of the work experience I have had and the projects I have been involved in.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (31, 'Tools & Technologies', '#### 🟢  Preferred technologies: \*

- Java, Spring Boot
- Kotlin
- Javascript / Typescript
- React / Angular / Vue
- NodeJS
- REST APIs / GraphQL
- MySQL / Postgres / MongoDB

#### 🟡  I’m not too experienced / familiar with, but I’m willing to consider:

- Python
- C#, .NET
- Go
- Swift, iOS development

#### 🔴  I’d rather not work with:

- PHP
- C / C++
- roles largely focused on infrastructure / DevOps

\* have a look at my [cv](/cv) and [projects](/projects) pages to get a better idea of the work experience I have had and the projects I have been involved in.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (20, 'Job Preferences', '**Fully remote only**.

- Infrequent onsite visits (say 1-2 per quarter) are fine.

I will be working from Italy, thus as an Italian tax resident
    
Options that I’m aware of for the above are:
    
- The company is based in Italy, or has a tax entity in the Italian territory
- Use of an EoR platform, such as [Remote.com](http://Remote.com) or Deel
- Hiring me as a contractor / freelancer

Preferably within **EMEA** to align with timezones
- Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well
- Eligible to work in the EU (Italian citizenship) and the UK (Settled Status)

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (21, 'TL;DR', '- 🏡 Remote-first position. (Infrequent visits to the office, say 1-2 per quarter, are fine.)
- 🇮🇹 Italian resident employment. (Preferably in EMEA to align with timezones, but willing to consider any location. Additionally, I have the right to work in the UK thanks to my "Settled Status".)
- 🖋️ Permanent or Contract.
- ⚙️ Ideally full-stack or backend-focused.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (22, 'Setting the Stage: Salary Expectations', 'Let''s talk money, shall we? While it''s not the job search holy grail, it does matter. As much as I''d love to pay my bills with passion, that''s not how the world works 😉💰

I get to the point: if the salary doesn''t align, I respectfully move on. It''s all about clarity, respect, and efficiency 😊👍💼

I came up with this fun little tool to help you get a sense of what I''m aiming for in my next role. The numbers aren''t etched in stone, but it''s a cool way to kick things off 🎉', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (27, 'Job Preferences', '**Fully remote only**.

- Infrequent onsite visits (say 1-2 per quarter) are fine.

I will be working from Italy, thus as an Italian tax resident
    
Options that I’m aware of for the above are:
    
- The company is based in Italy, or has a tax entity in the Italian territory
- Use of an EoR platform, such as [Remote.com](http://Remote.com) or Deel
- Hiring me as a contractor / freelancer

Preferably within **EMEA** to align with timezones
- Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well
- Eligible to work in the EU (Italian citizenship) and the UK (Settled Status)

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (28, 'TL;DR', '- 🏡 Remote-first position. (Infrequent visits to the office, say 1-2 per quarter, are fine.)
- 🇮🇹 Italian resident employment. (Preferably in EMEA to align with timezones, but willing to consider any location. Additionally, I have the right to work in the UK thanks to my "Settled Status".)
- 🖋️ Permanent or Contract.
- ⚙️ Ideally full-stack or backend-focused.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (29, 'Setting the Stage: Salary Expectations', 'Let''s talk money, shall we? While it''s not the job search holy grail, it does matter. As much as I''d love to pay my bills with passion, that''s not how the world works 😉💰

I get to the point: if the salary doesn''t align, I respectfully move on. It''s all about clarity, respect, and efficiency 😊👍💼

I came up with this fun little tool to help you get a sense of what I''m aiming for in my next role. The numbers aren''t etched in stone, but it''s a cool way to kick things off 🎉', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (30, 'Tools & Technologies', '#### 🟢  Preferred technologies: \*

- Java, Spring Boot
- Kotlin
- Javascript / Typescript
- React / Angular / Vue
- NodeJS
- REST APIs / GraphQL
- MySQL / Postgres / MongoDB

#### 🟡  I’m not too experienced / familiar with, but I’m willing to consider:

- Python
- C#, .NET
- Go
- Swift, iOS development

#### 🔴  I’d rather not work with:

- PHP
- C / C++
- roles largely focused on infrastructure / DevOps

\* have a look at my [cv](/cv) and [projects](/projects) pages to get a better idea of the work experience I have had and the projects I have been involved in.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (32, 'Job Preferences', '**Fully remote only**.

- Infrequent onsite visits (say 1-2 per quarter) are fine.

I will be working from Italy, thus as an Italian tax resident
    
Options that I’m aware of for the above are:
    
- The company is based in Italy, or has a tax entity in the Italian territory
- Use of an EoR platform, such as [Remote.com](http://Remote.com) or Deel
- Hiring me as a contractor / freelancer

Preferably within **EMEA** to align with timezones
- Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well
- Eligible to work in the EU (Italian citizenship) and the UK (Settled Status)

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (33, 'Job Preferences', '**Fully remote only**.

- Infrequent onsite visits (say 1-2 per quarter) are fine.

I will be working from Italy, thus as an Italian tax resident
    
Options that I’m aware of for the above are:
    
- The company is based in Italy, or has a tax entity in the Italian territory
- Use of an EoR platform, such as [Remote.com](http://Remote.com) or Deel
- Hiring me as a contractor / freelancer

Preferably within **EMEA** to align with timezones
- Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well
- Eligible to work in the EU (Italian citizenship) and the UK (Settled Status)

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (38, 'General Info', '#### Roles I’m interested in:

- Software Engineer
- Full-stack developer
- Backend developer

#### Seniority:

- 5+ years of work experience
- Mid to Senior level', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (59, '⚙️ Hardware', '**MacBook Pro 16” 2019** (2.6 GHz 6-core; Intel Core i7; 32 GB RAM; 1 TB Storage) ~ **work laptop** 💼

**MacBook Pro 13” 2018** (2.7 GHz 4-core; Intel Core i7; 16 GB RAM; 256 GB Storage) ~ **personal laptop** 👩🏻‍💻

Apple Magic Mouse

Logitech MX Keys

ASUS VA24DQLB 24” screen

ErGear Dual monitor stand

Bose SoundLink Around-Ear Wireless Headphones II

AirPods Pro

iPad Air 4th gen

**[Supernote A6X](https://supernote.eu/produit/bundle-a6x/)**: e-Ink ebook reader for note taking

New Kindle Paperwhite (2018)

iPhone 13

Synology NAS DS720+

**[AutoFull Ergonomic Gaming Chair](https://autofull.com/)** (Red)', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (46, 'Preferenze lavorative', '🏠 **Fully remote only**

- Infrequent onsite visits (say 1-2 per quarter) are fine.

🇮🇹 I will be working from Italy, thus as an **Italian tax resident**

<details>
  <summary>More on taxes</summary>
  <p>Options that I’m aware of for the above are:</p>

  - The company is based in Italy, or has a tax entity in the Italian territory;
  - Use of an EoR platform, such as
  <a href="https://remote.com" target="_blank">Remote</a> or
  <a href="https://deel.com/" target="_blank">Deel</a>;
  - Hiring me as a contractor / freelancer.
</details>


🌍 Preferably within **EMEA** to align with timezones
- Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well.
- Eligible to work in the EU 🇪🇺 (Italian citizenship) and the UK 🇬🇧 (Settled Status).

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (44, 'TL;DR', '🏡 Ruolo remote-first. (Vanno bene anche visite poco frequenti in ufficio, ad esempio 1-2 a trimestre).

🇮🇹 Impiego in Italia. (Preferibilmente in EMEA per allinearsi ai fusi orari, ma sono disposta a prendere in considerazione qualsiasi località. Inoltre, ho il diritto di lavorare nel Regno Unito grazie al mio "Settled Status").

🖋️ Lavoro permanente o a contratto.

⚙️ Idealmente full-stack o backend.
', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (45, 'First things first. Aspettative salariali', 'Parliamo di soldi, che ne dici? Anche se non è il Santo Graal della ricerca di lavoro, è un argomento importante. Per quanto mi piacerebbe pagare le bollette con passione e dedizione, purtroppo non è così che va il mondo 😉💰

Arrivo al punto: se lo stipendio non è in linea con le mie aspettative, declinerò educatamente l''offerta. È tutta una questione di chiarezza, rispetto ed efficienza 😊👍💼

Ho ideato questo piccolo strumento per aiutare a farti un''idea di ciò a cui sto puntando nel mio prossimo ruolo. I numeri non sono incisi nella pietra, ma è un modo simpatico per dare il via alle cose 🎉', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (43, '🎯 Productivity', '**Notion**, for organizing my notes

**Obsidian**, as a second brain

Slack

Discord

**Telegram**: do people really still use Whatsapp?

**Microsoft To Do**, basically for organizing my life

**GoodReads** for keeping track of the books I read

**Google Play Books** for syncing ebooks across devices

DeepL

**[XBar](https://xbarapp.com/)**: put anything in my MacOS menu bar

**[Raindrop.io](https://raindrop.io/)** for organizing my (way too many) online bookmarks

**Pinterest**, for gathering ideas and finding inspiration about any topic', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (40, '🎬 Media', '**Plex** for organizing my movie, tv-series and music library

**Spotify** mainly for podcasts

**Storytel** for audiobooks', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (47, 'Linguaggi e Tecnologie', '#### 🟢  Preferred technologies: \*

- Java, Spring Boot
- Kotlin
- Javascript / Typescript
- React / Angular / Vue
- NodeJS
- REST APIs / GraphQL
- MySQL / Postgres / MongoDB

#### 🟡  I’m not too experienced / familiar with, but I’m willing to consider:

- Python
- C#, .NET
- Go
- Swift, iOS development

#### 🔴  I’d rather not work with:

- PHP
- C / C++
- roles largely focused on infrastructure / DevOps

\* have a look at my [cv](/cv) and [projects](/projects) pages to get a better idea of the work experience I have had and the projects I have been involved in.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (48, 'Informazioni generali', '#### Roles I’m interested in

- Software Engineer
- Full-stack developer
- Backend developer

#### Seniority

- 5+ years of work experience
- Mid to Senior level', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (37, 'Job Preferences', '🏠 **Fully remote only**

- Infrequent onsite visits (say 1-2 per quarter) are fine.

🇮🇹 I will be working from Italy, thus as an **Italian tax resident**

<details>
  <summary>More on taxes</summary>
  <p>Options that I’m aware of for the above are:</p>

  - The company is based in Italy, or has a tax entity in the Italian territory;
  - Use of an EoR platform, such as
  <a href="https://remote.com" target="_blank">Remote</a> or
  <a href="https://deel.com/" target="_blank">Deel</a>;
  - Hiring me as a contractor / freelancer.
</details>


🌍 Preferably within **EMEA** to align with timezones
- Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well.
- Eligible to work in the EU 🇪🇺 (Italian citizenship) and the UK 🇬🇧 ([Settled Status](https://www.gov.uk/settled-status-eu-citizens-families)).

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (42, '🔐 Security', '**Bitwarden**: password manager

Nord VPN

**Authy**: 2FA code generator

**Brave**: faster and more privacy-friendly than Chrome', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (49, 'Job Preferences', '🏠 **Fully remote only**

- Infrequent onsite visits (say 1-2 per quarter) are fine.

🇮🇹 I will be working from Italy, thus as an **Italian tax resident**

<details>
  <summary>More on taxes</summary>
  <p>Options you may want to consider are:</p>

  - The company is based in Italy, or has a tax entity in the Italian territory;
  - Using of an EoR platform, such as
  <a href="https://remote.com" target="_blank">Remote</a> or
  <a href="https://deel.com/" target="_blank">Deel</a>;
  - Hiring me as a contractor / freelancer.
</details>


🌍 Preferably within **EMEA** to align with timezones
- Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well.
- Eligible to work in the EU 🇪🇺 (Italian citizenship) and the UK 🇬🇧 ([Settled Status](https://www.gov.uk/settled-status-eu-citizens-families)).

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (41, '🛠️ Programming Tools', 'IntelliJ IDEA

Visual Studio Code

iTerm terminal

Postman', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (51, 'Setting the Stage: Salary Expectations', 'Let''s talk money, shall we? While it''s not the job search holy grail, it does matter. As much as I''d love to pay my bills with passion and dedication, unfortunately that''s not how the world works 😉💰

I get to the point: if the salary doesn''t align, I respectfully move on. It''s all about clarity, respect, and efficiency 😊👍💼

I came up with this fun little tool to help you get a sense of what I''m aiming for in my next role. The numbers aren''t etched in stone, but it''s a cool way to kick things off 🎉', '<details>
  <summary>Are you Italian and/or these numbers look insane to you? 🙀</summary>
  
I completely understand. Being an Italian myself, I know all too well the challenges and relatively lower salaries that many professionals, including software engineers, contend with in our Bel Paese. But, here''s the deal: the numbers I''m putting out there are on par with the European salary averages. 

I firmly believe in fair compensation for the value I bring to the table. My goal is to secure a salary that truly reflects my skills and experience without any compromises. This is my little way of pushing for a change. 🚀💪🇮🇹
</details>');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (52, 'Tools & Technologies', '#### 🟢  Preferred technologies: \*

- Java, Spring Boot
- Kotlin
- Javascript / Typescript
- React / Angular / Vue
- NodeJS
- REST APIs / GraphQL
- MySQL / Postgres / MongoDB

#### 🟡  I’m not too experienced / familiar with, but I’m willing to consider:

- Python
- C#, .NET
- Go
- Swift, iOS development

#### 🔴  I’d rather not work with:

- PHP
- C / C++
- roles largely focused on infrastructure / DevOps

\* have a look at my [cv](/cv) and [projects](/projects) pages to get a better idea of the work experience I have had and the projects I have been involved in.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (53, 'General Info', '#### Roles I’m interested in:

- Software Engineer
- Full-stack developer
- Backend developer

#### Seniority:

- 5+ years of work experience
- Mid to Senior level', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (54, 'Job Preferences', '🏠 **Fully remote only**

- Infrequent onsite visits (say 1-2 per quarter) are fine.

🇮🇹 I will be working from Italy, thus as an **Italian tax resident**

<details>
  <summary>More on taxes</summary>
  <p>Options you may want to consider for the above:</p>

  - The company is based in Italy, or has a tax entity in the Italian territory;
  - Use of an EoR platform, such as
  <a href="https://remote.com" target="_blank">Remote</a> or
  <a href="https://deel.com/" target="_blank">Deel</a>;
  - Hiring me as a contractor / freelancer, who will bill through their own company.
</details>


🌍 Preferably within **EMEA** to align with timezones
- Roughly UTC -2:00 | UTC +3:00… but anything that works for the company should work for me as well.
- Eligible to work in the EU 🇪🇺 (Italian citizenship) and the UK 🇬🇧 ([Settled Status](https://www.gov.uk/settled-status-eu-citizens-families)).

### Benefits I’d appreciate

- Equity scheme
- 28+ days annual leave
- Flexible hours
- Time and budget for professional training & development

### Company preferences

**Company sizes**: anywhere from established startups (10-50 employees) to medium-sized companies and large enterprises 

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Public Infrastructure / Defence, Retail, Technology, Travel.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (55, 'TL;DR', '🏡 Remote-first position. (Infrequent visits to the office, say 1-2 per quarter, are fine.)

🇮🇹 Italian resident employment. (Preferably in EMEA to align with timezones, but willing to consider any location. Additionally, I have the right to work in the UK thanks to my acquired "[Settled Status](https://www.gov.uk/settled-status-eu-citizens-families)".)

🖋️ Permanent or Contract.

⚙️ Ideally full-stack or backend-focused.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (56, 'Setting the Stage: Salary Expectations', 'Let''s talk money, shall we? While it''s not the job search holy grail, it does matter. As much as I''d love to pay my bills with passion and dedication, unfortunately that''s not how the world works 😉💰

To get to the point: if the salary doesn''t align, I respectfully move on. It''s all about clarity, respect, and efficiency 😊👍💼

I came up with this fun little tool to help you get a sense of what I''m aiming for in my next role. The numbers aren''t etched in stone, but it''s a cool way to kick things off 🎉', '<details>
  <summary>Are you Italian and/or these numbers look insane to you? 🙀</summary>
  
I completely understand. Being an Italian myself, I know all too well the challenges and relatively lower salaries that many professionals, including software engineers, contend with in our Bel Paese. But, here''s the deal: the numbers I''m putting out there are on par with the European salary averages - as well as what current employers are paying me.

I firmly believe in fair compensation for the value I bring to the table. My goal is to secure a salary that truly reflects my skills and experience without any compromises. This is my little way of pushing for a change. 🚀💪🇮🇹
</details>');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (57, 'Tools & Technologies', '#### 🟢  Preferred technologies: \*

- Java, Spring Boot
- Kotlin
- Javascript / Typescript
- React / Angular / Vue
- NodeJS
- REST APIs / GraphQL
- MySQL / Postgres / MongoDB

#### 🟡  I’m not too experienced / familiar with, but I’m willing to consider:

- Python
- C#, .NET
- Go
- Swift, iOS development

#### 🔴  I’d rather not work with:

- PHP
- C / C++
- roles largely focused on infrastructure / DevOps

\* have a look at my [cv](/cv) and [projects](/projects) pages to get a better idea of the work experience I have had and the projects I have been involved in.', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (58, 'General Info', '#### Roles I’m interested in:

- Software Engineer
- Full-stack developer
- Backend developer

#### Seniority:

- 5+ years of work experience
- Mid to Senior level', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (61, '🛠️ Programming Tools', 'IntelliJ IDEA

Visual Studio Code

iTerm terminal

Postman', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (62, '🔐 Security', '**Bitwarden**: password manager

Nord VPN

**Authy**: 2FA code generator

**Brave**: faster and more privacy-friendly than Chrome', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (39, '⚙️ Hardware', '**MacBook Pro 16” 2019** (2.6 GHz 6-core; Intel Core i7; 32 GB RAM; 1 TB Storage) ~ **work laptop** 💼

**MacBook Pro 13” 2018** (2.7 GHz 4-core; Intel Core i7; 16 GB RAM; 256 GB Storage) ~ **personal laptop** 👩🏻‍💻

Apple Magic Mouse

Logitech MX Keys

ASUS VA24DQLB 24” screen

ErGear Dual monitor stand

Bose SoundLink Around-Ear Wireless Headphones II

AirPods Pro

iPad Air 4th gen

**[Supernote A6X](https://supernote.eu/produit/bundle-a6x/)**: e-Ink ebook reader for note taking

New Kindle Paperwhite (2018)

iPhone 13

Synology NAS DS720+

**[AutoFull Ergonomic Gaming Chair](https://autofull.com/)** (Red)', NULL);
INSERT INTO public.components_shared_titled_paragraphs (id, title, content, outro) VALUES (60, '🎬 Media', '**Plex** for organizing my movie, tv-series and music library

**Spotify** mainly for podcasts

**Storytel** for audiobooks', NULL);


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (168, 'comp61511_msc_dissertation.pdf', NULL, NULL, NULL, NULL, NULL, 'comp61511_msc_dissertation_cb2037a756', '.pdf', 'application/pdf', 852.63, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697907014/comp61511_msc_dissertation_cb2037a756.pdf', NULL, 'cloudinary', '{"public_id": "comp61511_msc_dissertation_cb2037a756", "resource_type": "image"}', '/8', '2023-10-21 16:50:14.602', '2023-10-21 16:50:41.419', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (6, 'it.svg', NULL, NULL, 512, 512, NULL, 'it_00c57db1fb', '.svg', 'image/svg+xml', 0.80, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692716604/it_00c57db1fb.svg', NULL, 'cloudinary', '{"public_id": "it_00c57db1fb", "resource_type": "image"}', '/10', '2023-08-22 15:03:26.214', '2023-10-27 17:06:19.584', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (5, 'de.svg', NULL, NULL, 512, 512, NULL, 'de_9c5221adfa', '.svg', 'image/svg+xml', 0.68, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692716604/de_9c5221adfa.svg', NULL, 'cloudinary', '{"public_id": "de_9c5221adfa", "resource_type": "image"}', '/10', '2023-08-22 15:03:26.192', '2023-08-22 15:03:26.192', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (8, 'fr.svg', NULL, NULL, 512, 512, NULL, 'fr_eb256cde21', '.svg', 'image/svg+xml', 0.73, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692716604/fr_eb256cde21.svg', NULL, 'cloudinary', '{"public_id": "fr_eb256cde21", "resource_type": "image"}', '/10', '2023-08-22 15:03:26.463', '2023-08-22 15:03:26.463', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (1, 'Resourcify.png', NULL, NULL, 303, 303, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692123344/thumbnail_Resourcify_32e03a1d59.png", "hash": "thumbnail_Resourcify_32e03a1d59", "mime": "image/png", "name": "thumbnail_Resourcify.png", "path": null, "size": 6.25, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_Resourcify_32e03a1d59", "resource_type": "image"}}}', 'Resourcify_32e03a1d59', '.png', 'image/png', 3.36, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692123344/Resourcify_32e03a1d59.png', NULL, 'cloudinary', '{"public_id": "Resourcify_32e03a1d59", "resource_type": "image"}', '/9', '2023-08-15 18:15:45.084', '2023-08-17 20:40:20.146', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (7, 'uk.svg', NULL, NULL, 512, 512, NULL, 'uk_657deb6132', '.svg', 'image/svg+xml', 2.27, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692716604/uk_657deb6132.svg', NULL, 'cloudinary', '{"public_id": "uk_657deb6132", "resource_type": "image"}', '/10', '2023-08-22 15:03:26.438', '2023-10-07 17:20:50.495', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (169, 'xbar.webp', NULL, NULL, 1281, 700, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697908493/large_xbar_974af5a8d0.webp", "hash": "large_xbar_974af5a8d0", "mime": "image/webp", "name": "large_xbar.webp", "path": null, "size": 64.96, "width": 1000, "height": 546, "provider_metadata": {"public_id": "large_xbar_974af5a8d0", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697908493/small_xbar_974af5a8d0.webp", "hash": "small_xbar_974af5a8d0", "mime": "image/webp", "name": "small_xbar.webp", "path": null, "size": 24.44, "width": 500, "height": 273, "provider_metadata": {"public_id": "small_xbar_974af5a8d0", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697908493/medium_xbar_974af5a8d0.webp", "hash": "medium_xbar_974af5a8d0", "mime": "image/webp", "name": "medium_xbar.webp", "path": null, "size": 44.03, "width": 750, "height": 410, "provider_metadata": {"public_id": "medium_xbar_974af5a8d0", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697908493/thumbnail_xbar_974af5a8d0.webp", "hash": "thumbnail_xbar_974af5a8d0", "mime": "image/webp", "name": "thumbnail_xbar.webp", "path": null, "size": 8.01, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_xbar_974af5a8d0", "resource_type": "image"}}}', 'xbar_974af5a8d0', '.webp', 'image/webp', 105.34, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697908493/xbar_974af5a8d0.webp', NULL, 'cloudinary', '{"public_id": "xbar_974af5a8d0", "resource_type": "image"}', '/6', '2023-10-21 17:14:53.609', '2023-10-21 17:14:53.609', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (22, 'code2.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798463/thumbnail_code2_64d12c0ada.webp", "hash": "thumbnail_code2_64d12c0ada", "mime": "image/webp", "name": "thumbnail_code2.webp", "path": null, "size": 3.26, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_code2_64d12c0ada", "resource_type": "image"}}}', 'code2_64d12c0ada', '.webp', 'image/webp', 8.09, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798463/code2_64d12c0ada.webp', NULL, 'cloudinary', '{"public_id": "code2_64d12c0ada", "resource_type": "image"}', '/1', '2023-08-23 13:47:43.461', '2023-08-23 13:47:43.461', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (21, 'laptop.svg', NULL, NULL, 410, 410, NULL, 'laptop_4a3ba3b30c', '.svg', 'image/svg+xml', 7.10, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692734473/laptop_4a3ba3b30c.svg', NULL, 'cloudinary', '{"public_id": "laptop_4a3ba3b30c", "resource_type": "image"}', '/5', '2023-08-22 20:01:14.08', '2023-08-22 20:01:14.08', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (18, 'python.svg', NULL, NULL, 128, 128, NULL, 'python_bfafede620', '.svg', 'image/svg+xml', 2.17, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692732723/python_bfafede620.svg', NULL, 'cloudinary', '{"public_id": "python_bfafede620", "resource_type": "image"}', '/7', '2023-08-22 19:32:04.52', '2023-08-22 19:32:04.52', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (19, 'java.svg', NULL, NULL, 128, 128, NULL, 'java_485a6e1666', '.svg', 'image/svg+xml', 1.54, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692732723/java_485a6e1666.svg', NULL, 'cloudinary', '{"public_id": "java_485a6e1666", "resource_type": "image"}', '/7', '2023-08-22 19:32:04.636', '2023-08-22 19:32:04.636', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (20, 'hibernate.svg', NULL, NULL, 256, 256, NULL, 'hibernate_4a990cdba3', '.svg', 'image/svg+xml', 3.60, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692732723/hibernate_4a990cdba3.svg', NULL, 'cloudinary', '{"public_id": "hibernate_4a990cdba3", "resource_type": "image"}', '/7', '2023-08-22 19:32:04.714', '2023-08-22 19:32:04.714', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (14, 'us.svg', NULL, NULL, 512, 512, NULL, 'us_f39fa66a76', '.svg', 'image/svg+xml', 3.36, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692724050/us_f39fa66a76.svg', NULL, 'cloudinary', '{"public_id": "us_f39fa66a76", "resource_type": "image"}', '/10', '2023-08-22 17:07:31.494', '2023-08-22 17:07:31.494', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (170, 'ict.webp', NULL, NULL, 1008, 551, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697908746/large_ict_1bc6a4ff0b.webp", "hash": "large_ict_1bc6a4ff0b", "mime": "image/webp", "name": "large_ict.webp", "path": null, "size": 15.74, "width": 1000, "height": 547, "provider_metadata": {"public_id": "large_ict_1bc6a4ff0b", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697908746/small_ict_1bc6a4ff0b.webp", "hash": "small_ict_1bc6a4ff0b", "mime": "image/webp", "name": "small_ict.webp", "path": null, "size": 6.73, "width": 500, "height": 273, "provider_metadata": {"public_id": "small_ict_1bc6a4ff0b", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697908746/medium_ict_1bc6a4ff0b.webp", "hash": "medium_ict_1bc6a4ff0b", "mime": "image/webp", "name": "medium_ict.webp", "path": null, "size": 11.37, "width": 750, "height": 410, "provider_metadata": {"public_id": "medium_ict_1bc6a4ff0b", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697908745/thumbnail_ict_1bc6a4ff0b.webp", "hash": "thumbnail_ict_1bc6a4ff0b", "mime": "image/webp", "name": "thumbnail_ict.webp", "path": null, "size": 2.72, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_ict_1bc6a4ff0b", "resource_type": "image"}}}', 'ict_1bc6a4ff0b', '.webp', 'image/webp', 18.03, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697908745/ict_1bc6a4ff0b.webp', NULL, 'cloudinary', '{"public_id": "ict_1bc6a4ff0b", "resource_type": "image"}', '/6', '2023-10-21 17:19:06.422', '2023-10-21 17:19:06.422', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (33, 'lotr.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_lotr_9279421c8e.webp", "hash": "thumbnail_lotr_9279421c8e", "mime": "image/webp", "name": "thumbnail_lotr.webp", "path": null, "size": 3.89, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_lotr_9279421c8e", "resource_type": "image"}}}', 'lotr_9279421c8e', '.webp', 'image/webp', 10.82, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/lotr_9279421c8e.webp', NULL, 'cloudinary', '{"public_id": "lotr_9279421c8e", "resource_type": "image"}', '/1', '2023-08-23 13:47:44.944', '2023-08-23 13:47:44.944', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (34, 'jemisin.jpg', NULL, NULL, 314, 475, '{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_jemisin_78142aeb5c.jpg", "hash": "thumbnail_jemisin_78142aeb5c", "mime": "image/jpeg", "name": "thumbnail_jemisin.jpg", "path": null, "size": 6.47, "width": 103, "height": 156, "provider_metadata": {"public_id": "thumbnail_jemisin_78142aeb5c", "resource_type": "image"}}}', 'jemisin_78142aeb5c', '.jpg', 'image/jpeg', 52.11, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/jemisin_78142aeb5c.jpg', NULL, 'cloudinary', '{"public_id": "jemisin_78142aeb5c", "resource_type": "image"}', '/1', '2023-08-23 13:47:44.956', '2023-08-23 13:47:44.956', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (35, 'matilda.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_matilda_66485e3a09.webp", "hash": "thumbnail_matilda_66485e3a09", "mime": "image/webp", "name": "thumbnail_matilda.webp", "path": null, "size": 5.47, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_matilda_66485e3a09", "resource_type": "image"}}}', 'matilda_66485e3a09', '.webp', 'image/webp', 16.62, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/matilda_66485e3a09.webp', NULL, 'cloudinary', '{"public_id": "matilda_66485e3a09", "resource_type": "image"}', '/1', '2023-08-23 13:47:45.002', '2023-08-23 13:47:45.002', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (30, 'atwood.jpg', NULL, NULL, 321, 500, '{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_atwood_7450e7e874.jpg", "hash": "thumbnail_atwood_7450e7e874", "mime": "image/jpeg", "name": "thumbnail_atwood.jpg", "path": null, "size": 4.16, "width": 100, "height": 156, "provider_metadata": {"public_id": "thumbnail_atwood_7450e7e874", "resource_type": "image"}}}', 'atwood_7450e7e874', '.jpg', 'image/jpeg', 37.03, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/atwood_7450e7e874.jpg', NULL, 'cloudinary', '{"public_id": "atwood_7450e7e874", "resource_type": "image"}', '/1', '2023-08-23 13:47:44.894', '2023-08-23 13:47:44.894', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (32, 'adams.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/thumbnail_adams_20547a3b30.webp", "hash": "thumbnail_adams_20547a3b30", "mime": "image/webp", "name": "thumbnail_adams.webp", "path": null, "size": 5.52, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_adams_20547a3b30", "resource_type": "image"}}}', 'adams_20547a3b30', '.webp', 'image/webp', 15.86, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798464/adams_20547a3b30.webp', NULL, 'cloudinary', '{"public_id": "adams_20547a3b30", "resource_type": "image"}', '/1', '2023-08-23 13:47:44.904', '2023-08-23 13:47:44.904', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (171, 'werners.webp', NULL, NULL, 1162, 635, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697910083/large_werners_6e204f5195.webp", "hash": "large_werners_6e204f5195", "mime": "image/webp", "name": "large_werners.webp", "path": null, "size": 55.7, "width": 1000, "height": 546, "provider_metadata": {"public_id": "large_werners_6e204f5195", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697910083/small_werners_6e204f5195.webp", "hash": "small_werners_6e204f5195", "mime": "image/webp", "name": "small_werners.webp", "path": null, "size": 22.63, "width": 500, "height": 273, "provider_metadata": {"public_id": "small_werners_6e204f5195", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697910083/medium_werners_6e204f5195.webp", "hash": "medium_werners_6e204f5195", "mime": "image/webp", "name": "medium_werners.webp", "path": null, "size": 39.57, "width": 750, "height": 410, "provider_metadata": {"public_id": "medium_werners_6e204f5195", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697910083/thumbnail_werners_6e204f5195.webp", "hash": "thumbnail_werners_6e204f5195", "mime": "image/webp", "name": "thumbnail_werners.webp", "path": null, "size": 8.32, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_werners_6e204f5195", "resource_type": "image"}}}', 'werners_6e204f5195', '.webp', 'image/webp', 76.85, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697910083/werners_6e204f5195.webp', NULL, 'cloudinary', '{"public_id": "werners_6e204f5195", "resource_type": "image"}', '/6', '2023-10-21 17:41:24.194', '2023-10-21 17:41:24.194', 1, 1);
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
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (108, 'fastapi.svg', NULL, NULL, 2500, 2500, NULL, 'fastapi_fe1360523b', '.svg', 'image/svg+xml', 0.24, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696712057/fastapi_fe1360523b.svg', NULL, 'cloudinary', '{"public_id": "fastapi_fe1360523b", "resource_type": "image"}', '/7', '2023-10-07 20:54:18.791', '2023-10-07 20:54:18.791', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (51, 'breaking_italy.jpg', NULL, NULL, 1200, 1200, '{"large": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/large_breaking_italy_dd37b452e7.jpg", "hash": "large_breaking_italy_dd37b452e7", "mime": "image/jpeg", "name": "large_breaking_italy.jpg", "path": null, "size": 48.76, "width": 1000, "height": 1000, "provider_metadata": {"public_id": "large_breaking_italy_dd37b452e7", "resource_type": "image"}}, "small": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/small_breaking_italy_dd37b452e7.jpg", "hash": "small_breaking_italy_dd37b452e7", "mime": "image/jpeg", "name": "small_breaking_italy.jpg", "path": null, "size": 20.37, "width": 500, "height": 500, "provider_metadata": {"public_id": "small_breaking_italy_dd37b452e7", "resource_type": "image"}}, "medium": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/medium_breaking_italy_dd37b452e7.jpg", "hash": "medium_breaking_italy_dd37b452e7", "mime": "image/jpeg", "name": "medium_breaking_italy.jpg", "path": null, "size": 33.6, "width": 750, "height": 750, "provider_metadata": {"public_id": "medium_breaking_italy_dd37b452e7", "resource_type": "image"}}, "thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/thumbnail_breaking_italy_dd37b452e7.jpg", "hash": "thumbnail_breaking_italy_dd37b452e7", "mime": "image/jpeg", "name": "thumbnail_breaking_italy.jpg", "path": null, "size": 3.96, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_breaking_italy_dd37b452e7", "resource_type": "image"}}}', 'breaking_italy_dd37b452e7', '.jpg', 'image/jpeg', 62.00, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798589/breaking_italy_dd37b452e7.jpg', NULL, 'cloudinary', '{"public_id": "breaking_italy_dd37b452e7", "resource_type": "image"}', '/2', '2023-08-23 13:49:49.864', '2023-08-23 13:49:49.864', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (172, 'glurns..webp', NULL, NULL, 713, 390, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697910305/small_glurns_fcfb87b0b5.webp", "hash": "small_glurns_fcfb87b0b5", "mime": "image/webp", "name": "small_glurns..webp", "path": null, "size": 12.43, "width": 500, "height": 273, "provider_metadata": {"public_id": "small_glurns_fcfb87b0b5", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697910304/thumbnail_glurns_fcfb87b0b5.webp", "hash": "thumbnail_glurns_fcfb87b0b5", "mime": "image/webp", "name": "thumbnail_glurns..webp", "path": null, "size": 4.89, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_glurns_fcfb87b0b5", "resource_type": "image"}}}', 'glurns_fcfb87b0b5', '.webp', 'image/webp', 22.82, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697910304/glurns_fcfb87b0b5.webp', NULL, 'cloudinary', '{"public_id": "glurns_fcfb87b0b5", "resource_type": "image"}', '/6', '2023-10-21 17:45:05.498', '2023-10-21 17:45:05.498', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (52, 'black-mirror.webp', NULL, NULL, 438, 656, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798617/small_black_mirror_99a33da84e.webp", "hash": "small_black_mirror_99a33da84e", "mime": "image/webp", "name": "small_black-mirror.webp", "path": null, "size": 37.81, "width": 334, "height": 500, "provider_metadata": {"public_id": "small_black_mirror_99a33da84e", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798617/thumbnail_black_mirror_99a33da84e.webp", "hash": "thumbnail_black_mirror_99a33da84e", "mime": "image/webp", "name": "thumbnail_black-mirror.webp", "path": null, "size": 5.85, "width": 104, "height": 156, "provider_metadata": {"public_id": "thumbnail_black_mirror_99a33da84e", "resource_type": "image"}}}', 'black_mirror_99a33da84e', '.webp', 'image/webp', 65.68, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798617/black_mirror_99a33da84e.webp', NULL, 'cloudinary', '{"public_id": "black_mirror_99a33da84e", "resource_type": "image"}', '/3', '2023-08-23 13:50:18.232', '2023-08-23 13:50:18.232', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (53, 'westworld.jpg', NULL, NULL, 420, 623, '{"small": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798618/small_westworld_8e456e5ac2.jpg", "hash": "small_westworld_8e456e5ac2", "mime": "image/jpeg", "name": "small_westworld.jpg", "path": null, "size": 27.03, "width": 337, "height": 500, "provider_metadata": {"public_id": "small_westworld_8e456e5ac2", "resource_type": "image"}}, "thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798618/thumbnail_westworld_8e456e5ac2.jpg", "hash": "thumbnail_westworld_8e456e5ac2", "mime": "image/jpeg", "name": "thumbnail_westworld.jpg", "path": null, "size": 4.65, "width": 105, "height": 156, "provider_metadata": {"public_id": "thumbnail_westworld_8e456e5ac2", "resource_type": "image"}}}', 'westworld_8e456e5ac2', '.jpg', 'image/jpeg', 38.11, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798617/westworld_8e456e5ac2.jpg', NULL, 'cloudinary', '{"public_id": "westworld_8e456e5ac2", "resource_type": "image"}', '/3', '2023-08-23 13:50:18.557', '2023-08-23 13:50:18.557', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (54, 'doctor-who.jpg', NULL, NULL, 473, 709, '{"small": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798618/small_doctor_who_3b73bd0c22.jpg", "hash": "small_doctor_who_3b73bd0c22", "mime": "image/jpeg", "name": "small_doctor-who.jpg", "path": null, "size": 37.37, "width": 334, "height": 500, "provider_metadata": {"public_id": "small_doctor_who_3b73bd0c22", "resource_type": "image"}}, "thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798618/thumbnail_doctor_who_3b73bd0c22.jpg", "hash": "thumbnail_doctor_who_3b73bd0c22", "mime": "image/jpeg", "name": "thumbnail_doctor-who.jpg", "path": null, "size": 5.84, "width": 104, "height": 156, "provider_metadata": {"public_id": "thumbnail_doctor_who_3b73bd0c22", "resource_type": "image"}}}', 'doctor_who_3b73bd0c22', '.jpg', 'image/jpeg', 68.39, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798618/doctor_who_3b73bd0c22.jpg', NULL, 'cloudinary', '{"public_id": "doctor_who_3b73bd0c22", "resource_type": "image"}', '/3', '2023-08-23 13:50:18.615', '2023-08-23 13:50:18.615', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (55, 'sherlock.jpg', NULL, NULL, 400, 600, '{"small": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798618/small_sherlock_9f9a1a3ecd.jpg", "hash": "small_sherlock_9f9a1a3ecd", "mime": "image/jpeg", "name": "small_sherlock.jpg", "path": null, "size": 39.76, "width": 333, "height": 500, "provider_metadata": {"public_id": "small_sherlock_9f9a1a3ecd", "resource_type": "image"}}, "thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798618/thumbnail_sherlock_9f9a1a3ecd.jpg", "hash": "thumbnail_sherlock_9f9a1a3ecd", "mime": "image/jpeg", "name": "thumbnail_sherlock.jpg", "path": null, "size": 5.54, "width": 104, "height": 156, "provider_metadata": {"public_id": "thumbnail_sherlock_9f9a1a3ecd", "resource_type": "image"}}}', 'sherlock_9f9a1a3ecd', '.jpg', 'image/jpeg', 56.56, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798618/sherlock_9f9a1a3ecd.jpg', NULL, 'cloudinary', '{"public_id": "sherlock_9f9a1a3ecd", "resource_type": "image"}', '/3', '2023-08-23 13:50:18.702', '2023-08-23 13:50:18.702', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (57, 'chernobyl.webp', NULL, NULL, 612, 917, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/small_chernobyl_26276e09f5.webp", "hash": "small_chernobyl_26276e09f5", "mime": "image/webp", "name": "small_chernobyl.webp", "path": null, "size": 7.36, "width": 334, "height": 500, "provider_metadata": {"public_id": "small_chernobyl_26276e09f5", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/medium_chernobyl_26276e09f5.webp", "hash": "medium_chernobyl_26276e09f5", "mime": "image/webp", "name": "medium_chernobyl.webp", "path": null, "size": 12.13, "width": 501, "height": 750, "provider_metadata": {"public_id": "medium_chernobyl_26276e09f5", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/thumbnail_chernobyl_26276e09f5.webp", "hash": "thumbnail_chernobyl_26276e09f5", "mime": "image/webp", "name": "thumbnail_chernobyl.webp", "path": null, "size": 1.73, "width": 104, "height": 156, "provider_metadata": {"public_id": "thumbnail_chernobyl_26276e09f5", "resource_type": "image"}}}', 'chernobyl_26276e09f5', '.webp', 'image/webp', 27.75, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/chernobyl_26276e09f5.webp', NULL, 'cloudinary', '{"public_id": "chernobyl_26276e09f5", "resource_type": "image"}', '/3', '2023-08-23 13:52:01.708', '2023-08-23 13:52:01.708', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (65, 'rocket_league.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/thumbnail_rocket_league_40f1eff83f.png", "hash": "thumbnail_rocket_league_40f1eff83f", "mime": "image/png", "name": "thumbnail_rocket_league.png", "path": null, "size": 40.51, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_rocket_league_40f1eff83f", "resource_type": "image"}}}', 'rocket_league_40f1eff83f', '.png', 'image/png', 39.31, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/rocket_league_40f1eff83f.png', NULL, 'cloudinary', '{"public_id": "rocket_league_40f1eff83f", "resource_type": "image"}', '/4', '2023-08-23 16:20:36.783', '2023-08-23 16:20:36.783', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (66, 'rayman_legends.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/thumbnail_rayman_legends_a6c563bbfa.png", "hash": "thumbnail_rayman_legends_a6c563bbfa", "mime": "image/png", "name": "thumbnail_rayman_legends.png", "path": null, "size": 50.11, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_rayman_legends_a6c563bbfa", "resource_type": "image"}}}', 'rayman_legends_a6c563bbfa', '.png', 'image/png', 54.52, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/rayman_legends_a6c563bbfa.png', NULL, 'cloudinary', '{"public_id": "rayman_legends_a6c563bbfa", "resource_type": "image"}', '/4', '2023-08-23 16:20:36.877', '2023-08-23 16:20:36.877', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (149, 'postgres.svg', NULL, NULL, 128, 128, NULL, 'postgres_33a4b05753', '.svg', 'image/svg+xml', 9.55, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696778215/postgres_33a4b05753.svg', NULL, 'cloudinary', '{"public_id": "postgres_33a4b05753", "resource_type": "image"}', '/7', '2023-10-08 15:16:57.189', '2023-10-08 15:16:57.189', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (58, 'breaking-bad.webp', NULL, NULL, 678, 1000, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/small_breaking_bad_c234310201.webp", "hash": "small_breaking_bad_c234310201", "mime": "image/webp", "name": "small_breaking-bad.webp", "path": null, "size": 30.92, "width": 339, "height": 500, "provider_metadata": {"public_id": "small_breaking_bad_c234310201", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/medium_breaking_bad_c234310201.webp", "hash": "medium_breaking_bad_c234310201", "mime": "image/webp", "name": "medium_breaking-bad.webp", "path": null, "size": 48.85, "width": 508, "height": 750, "provider_metadata": {"public_id": "medium_breaking_bad_c234310201", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/thumbnail_breaking_bad_c234310201.webp", "hash": "thumbnail_breaking_bad_c234310201", "mime": "image/webp", "name": "thumbnail_breaking-bad.webp", "path": null, "size": 4.97, "width": 106, "height": 156, "provider_metadata": {"public_id": "thumbnail_breaking_bad_c234310201", "resource_type": "image"}}}', 'breaking_bad_c234310201', '.webp', 'image/webp', 77.52, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/breaking_bad_c234310201.webp', NULL, 'cloudinary', '{"public_id": "breaking_bad_c234310201", "resource_type": "image"}', '/3', '2023-08-23 13:52:01.834', '2023-08-23 13:52:01.834', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (59, 'better-call-saul.jpg', NULL, NULL, 1320, 1980, '{"large": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/large_better_call_saul_4e68c2794f.jpg", "hash": "large_better_call_saul_4e68c2794f", "mime": "image/jpeg", "name": "large_better-call-saul.jpg", "path": null, "size": 55.33, "width": 667, "height": 1000, "provider_metadata": {"public_id": "large_better_call_saul_4e68c2794f", "resource_type": "image"}}, "small": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/small_better_call_saul_4e68c2794f.jpg", "hash": "small_better_call_saul_4e68c2794f", "mime": "image/jpeg", "name": "small_better-call-saul.jpg", "path": null, "size": 18.57, "width": 333, "height": 500, "provider_metadata": {"public_id": "small_better_call_saul_4e68c2794f", "resource_type": "image"}}, "medium": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/medium_better_call_saul_4e68c2794f.jpg", "hash": "medium_better_call_saul_4e68c2794f", "mime": "image/jpeg", "name": "medium_better-call-saul.jpg", "path": null, "size": 34.43, "width": 500, "height": 750, "provider_metadata": {"public_id": "medium_better_call_saul_4e68c2794f", "resource_type": "image"}}, "thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/thumbnail_better_call_saul_4e68c2794f.jpg", "hash": "thumbnail_better_call_saul_4e68c2794f", "mime": "image/jpeg", "name": "thumbnail_better-call-saul.jpg", "path": null, "size": 3.43, "width": 104, "height": 156, "provider_metadata": {"public_id": "thumbnail_better_call_saul_4e68c2794f", "resource_type": "image"}}}', 'better_call_saul_4e68c2794f', '.jpg', 'image/jpeg', 149.21, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798721/better_call_saul_4e68c2794f.jpg', NULL, 'cloudinary', '{"public_id": "better_call_saul_4e68c2794f", "resource_type": "image"}', '/3', '2023-08-23 13:52:02.181', '2023-08-23 13:52:02.181', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (60, 'stranger-things.webp', NULL, NULL, 865, 1300, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798865/large_stranger_things_5ead17cfb6.webp", "hash": "large_stranger_things_5ead17cfb6", "mime": "image/webp", "name": "large_stranger-things.webp", "path": null, "size": 140.58, "width": 665, "height": 1000, "provider_metadata": {"public_id": "large_stranger_things_5ead17cfb6", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798865/small_stranger_things_5ead17cfb6.webp", "hash": "small_stranger_things_5ead17cfb6", "mime": "image/webp", "name": "small_stranger-things.webp", "path": null, "size": 43.42, "width": 333, "height": 500, "provider_metadata": {"public_id": "small_stranger_things_5ead17cfb6", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798865/medium_stranger_things_5ead17cfb6.webp", "hash": "medium_stranger_things_5ead17cfb6", "mime": "image/webp", "name": "medium_stranger-things.webp", "path": null, "size": 88.64, "width": 499, "height": 750, "provider_metadata": {"public_id": "medium_stranger_things_5ead17cfb6", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798865/thumbnail_stranger_things_5ead17cfb6.webp", "hash": "thumbnail_stranger_things_5ead17cfb6", "mime": "image/webp", "name": "thumbnail_stranger-things.webp", "path": null, "size": 5.76, "width": 104, "height": 156, "provider_metadata": {"public_id": "thumbnail_stranger_things_5ead17cfb6", "resource_type": "image"}}}', 'stranger_things_5ead17cfb6', '.webp', 'image/webp', 262.88, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798865/stranger_things_5ead17cfb6.webp', NULL, 'cloudinary', '{"public_id": "stranger_things_5ead17cfb6", "resource_type": "image"}', '/3', '2023-08-23 13:54:26.34', '2023-08-23 13:54:26.34', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (61, 'unorthodox.webp', NULL, NULL, 2500, 3704, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798867/large_unorthodox_08431e1d41.webp", "hash": "large_unorthodox_08431e1d41", "mime": "image/webp", "name": "large_unorthodox.webp", "path": null, "size": 45.09, "width": 675, "height": 1000, "provider_metadata": {"public_id": "large_unorthodox_08431e1d41", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798867/small_unorthodox_08431e1d41.webp", "hash": "small_unorthodox_08431e1d41", "mime": "image/webp", "name": "small_unorthodox.webp", "path": null, "size": 15.91, "width": 337, "height": 500, "provider_metadata": {"public_id": "small_unorthodox_08431e1d41", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798867/medium_unorthodox_08431e1d41.webp", "hash": "medium_unorthodox_08431e1d41", "mime": "image/webp", "name": "medium_unorthodox.webp", "path": null, "size": 28.64, "width": 506, "height": 750, "provider_metadata": {"public_id": "medium_unorthodox_08431e1d41", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798866/thumbnail_unorthodox_08431e1d41.webp", "hash": "thumbnail_unorthodox_08431e1d41", "mime": "image/webp", "name": "thumbnail_unorthodox.webp", "path": null, "size": 3.12, "width": 105, "height": 156, "provider_metadata": {"public_id": "thumbnail_unorthodox_08431e1d41", "resource_type": "image"}}}', 'unorthodox_08431e1d41', '.webp', 'image/webp', 455.12, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798867/unorthodox_08431e1d41.webp', NULL, 'cloudinary', '{"public_id": "unorthodox_08431e1d41", "resource_type": "image"}', '/3', '2023-08-23 13:54:28.327', '2023-08-23 13:54:28.327', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (62, 'pokemon_go.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807635/thumbnail_pokemon_go_7aa758899d.png", "hash": "thumbnail_pokemon_go_7aa758899d", "mime": "image/png", "name": "thumbnail_pokemon_go.png", "path": null, "size": 29.29, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_pokemon_go_7aa758899d", "resource_type": "image"}}}', 'pokemon_go_7aa758899d', '.png', 'image/png', 23.73, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807635/pokemon_go_7aa758899d.png', NULL, 'cloudinary', '{"public_id": "pokemon_go_7aa758899d", "resource_type": "image"}', '/4', '2023-08-23 16:20:35.424', '2023-08-23 16:20:35.424', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (63, 'ori2.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807635/thumbnail_ori2_cd61cf3cc3.png", "hash": "thumbnail_ori2_cd61cf3cc3", "mime": "image/png", "name": "thumbnail_ori2.png", "path": null, "size": 52.85, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_ori2_cd61cf3cc3", "resource_type": "image"}}}', 'ori2_cd61cf3cc3', '.png', 'image/png', 62.86, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807635/ori2_cd61cf3cc3.png', NULL, 'cloudinary', '{"public_id": "ori2_cd61cf3cc3", "resource_type": "image"}', '/4', '2023-08-23 16:20:35.643', '2023-08-23 16:20:35.643', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (64, 'croc2.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807635/thumbnail_croc2_bb0eda4c07.png", "hash": "thumbnail_croc2_bb0eda4c07", "mime": "image/png", "name": "thumbnail_croc2.png", "path": null, "size": 50.97, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_croc2_bb0eda4c07", "resource_type": "image"}}}', 'croc2_bb0eda4c07', '.png', 'image/png', 64.85, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807635/croc2_bb0eda4c07.png', NULL, 'cloudinary', '{"public_id": "croc2_bb0eda4c07", "resource_type": "image"}', '/4', '2023-08-23 16:20:35.635', '2023-08-23 16:20:35.635', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (87, 'bookingcom.svg', NULL, NULL, 2500, 424, NULL, 'bookingcom_91b7aa2e36', '.svg', 'image/svg+xml', 4.63, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1693067075/bookingcom_91b7aa2e36.svg', NULL, 'cloudinary', '{"public_id": "bookingcom_91b7aa2e36", "resource_type": "image"}', '/', '2023-08-26 16:24:36.239', '2023-08-26 16:24:36.239', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (150, 'firebase.svg', NULL, NULL, 48, 48, NULL, 'firebase_3677a8b754', '.svg', 'image/svg+xml', 0.51, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696778215/firebase_3677a8b754.svg', NULL, 'cloudinary', '{"public_id": "firebase_3677a8b754", "resource_type": "image"}', '/7', '2023-10-08 15:16:57.275', '2023-10-08 15:16:57.275', 1, 1);
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
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (151, 'mongodb.svg', NULL, NULL, 128, 128, NULL, 'mongodb_df6af1ecb2', '.svg', 'image/svg+xml', 5.70, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696778215/mongodb_df6af1ecb2.svg', NULL, 'cloudinary', '{"public_id": "mongodb_df6af1ecb2", "resource_type": "image"}', '/7', '2023-10-08 15:16:57.307', '2023-10-08 15:16:57.307', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (77, 'portal2.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/thumbnail_portal2_6a21964ea9.png", "hash": "thumbnail_portal2_6a21964ea9", "mime": "image/png", "name": "thumbnail_portal2.png", "path": null, "size": 46.24, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_portal2_6a21964ea9", "resource_type": "image"}}}', 'portal2_6a21964ea9', '.png', 'image/png', 52.24, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692807636/portal2_6a21964ea9.png', NULL, 'cloudinary', '{"public_id": "portal2_6a21964ea9", "resource_type": "image"}', '/4', '2023-08-23 16:20:37.175', '2023-08-23 16:20:37.175', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (78, 'the-last-of-us.webp', NULL, NULL, 2700, 4000, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692888366/large_the_last_of_us_7c834c95f8.webp", "hash": "large_the_last_of_us_7c834c95f8", "mime": "image/webp", "name": "large_the-last-of-us.webp", "path": null, "size": 80.16, "width": 675, "height": 1000, "provider_metadata": {"public_id": "large_the_last_of_us_7c834c95f8", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692888366/small_the_last_of_us_7c834c95f8.webp", "hash": "small_the_last_of_us_7c834c95f8", "mime": "image/webp", "name": "small_the-last-of-us.webp", "path": null, "size": 25.86, "width": 338, "height": 500, "provider_metadata": {"public_id": "small_the_last_of_us_7c834c95f8", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692888366/medium_the_last_of_us_7c834c95f8.webp", "hash": "medium_the_last_of_us_7c834c95f8", "mime": "image/webp", "name": "medium_the-last-of-us.webp", "path": null, "size": 49.51, "width": 506, "height": 750, "provider_metadata": {"public_id": "medium_the_last_of_us_7c834c95f8", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692888365/thumbnail_the_last_of_us_7c834c95f8.webp", "hash": "thumbnail_the_last_of_us_7c834c95f8", "mime": "image/webp", "name": "thumbnail_the-last-of-us.webp", "path": null, "size": 4.04, "width": 105, "height": 156, "provider_metadata": {"public_id": "thumbnail_the_last_of_us_7c834c95f8", "resource_type": "image"}}}', 'the_last_of_us_7c834c95f8', '.webp', 'image/webp', 1029.18, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692888365/the_last_of_us_7c834c95f8.webp', NULL, 'cloudinary', '{"public_id": "the_last_of_us_7c834c95f8", "resource_type": "image"}', '/3', '2023-08-24 14:46:06.746', '2023-08-24 14:46:06.746', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (79, 'the-umbrella-academy.jpg', NULL, NULL, 474, 709, '{"small": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692888601/small_the_umbrella_academy_1c8f0d9cc7.jpg", "hash": "small_the_umbrella_academy_1c8f0d9cc7", "mime": "image/jpeg", "name": "small_the-umbrella-academy.jpg", "path": null, "size": 42.17, "width": 334, "height": 500, "provider_metadata": {"public_id": "small_the_umbrella_academy_1c8f0d9cc7", "resource_type": "image"}}, "thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692888601/thumbnail_the_umbrella_academy_1c8f0d9cc7.jpg", "hash": "thumbnail_the_umbrella_academy_1c8f0d9cc7", "mime": "image/jpeg", "name": "thumbnail_the-umbrella-academy.jpg", "path": null, "size": 5.77, "width": 104, "height": 156, "provider_metadata": {"public_id": "thumbnail_the_umbrella_academy_1c8f0d9cc7", "resource_type": "image"}}}', 'the_umbrella_academy_1c8f0d9cc7', '.jpg', 'image/jpeg', 79.40, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692888601/the_umbrella_academy_1c8f0d9cc7.jpg', NULL, 'cloudinary', '{"public_id": "the_umbrella_academy_1c8f0d9cc7", "resource_type": "image"}', '/3', '2023-08-24 14:50:01.921', '2023-08-24 14:50:01.921', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (80, 'school.svg', NULL, NULL, 501, 501, NULL, 'school_bbe225685d', '.svg', 'image/svg+xml', 2.86, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692894192/school_bbe225685d.svg', NULL, 'cloudinary', '{"public_id": "school_bbe225685d", "resource_type": "image"}', '/5', '2023-08-24 16:23:13.834', '2023-08-24 16:23:13.834', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (81, 'internet.svg', NULL, NULL, 512, 512, NULL, 'internet_60bf166c34', '.svg', 'image/svg+xml', 2.88, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692894192/internet_60bf166c34.svg', NULL, 'cloudinary', '{"public_id": "internet_60bf166c34", "resource_type": "image"}', '/5', '2023-08-24 16:23:13.869', '2023-08-24 16:23:13.869', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (82, 'work.svg', NULL, NULL, 512, 512, NULL, 'work_f1bb1eb3dd', '.svg', 'image/svg+xml', 0.82, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692894192/work_f1bb1eb3dd.svg', NULL, 'cloudinary', '{"public_id": "work_f1bb1eb3dd", "resource_type": "image"}', '/5', '2023-08-24 16:23:14.064', '2023-08-24 16:23:14.064', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (83, 'newspaper.svg', NULL, NULL, 512, 512, NULL, 'newspaper_e15ec94d21', '.svg', 'image/svg+xml', 1.68, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692894192/newspaper_e15ec94d21.svg', NULL, 'cloudinary', '{"public_id": "newspaper_e15ec94d21", "resource_type": "image"}', '/5', '2023-08-24 16:23:14.141', '2023-08-24 16:23:14.141', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (173, 'programming.webp', NULL, NULL, 635, 347, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697910718/small_programming_238a67af47.webp", "hash": "small_programming_238a67af47", "mime": "image/webp", "name": "small_programming.webp", "path": null, "size": 15.86, "width": 500, "height": 273, "provider_metadata": {"public_id": "small_programming_238a67af47", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697910718/thumbnail_programming_238a67af47.webp", "hash": "thumbnail_programming_238a67af47", "mime": "image/webp", "name": "thumbnail_programming.webp", "path": null, "size": 6.04, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_programming_238a67af47", "resource_type": "image"}}}', 'programming_238a67af47', '.webp', 'image/webp', 23.36, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697910718/programming_238a67af47.webp', NULL, 'cloudinary', '{"public_id": "programming_238a67af47", "resource_type": "image"}', '/6', '2023-10-21 17:51:59.148', '2023-10-21 17:51:59.148', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (86, 'resourcify.webp', NULL, NULL, 600, 115, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1693067033/small_resourcify_69f3b5b70d.webp", "hash": "small_resourcify_69f3b5b70d", "mime": "image/webp", "name": "small_resourcify.webp", "path": null, "size": 7.78, "width": 500, "height": 96, "provider_metadata": {"public_id": "small_resourcify_69f3b5b70d", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1693067033/thumbnail_resourcify_69f3b5b70d.webp", "hash": "thumbnail_resourcify_69f3b5b70d", "mime": "image/webp", "name": "thumbnail_resourcify.webp", "path": null, "size": 3.34, "width": 245, "height": 47, "provider_metadata": {"public_id": "thumbnail_resourcify_69f3b5b70d", "resource_type": "image"}}}', 'resourcify_69f3b5b70d', '.webp', 'image/webp', 6.20, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1693067033/resourcify_69f3b5b70d.webp', NULL, 'cloudinary', '{"public_id": "resourcify_69f3b5b70d", "resource_type": "image"}', '/', '2023-08-26 16:23:53.696', '2023-08-26 16:23:53.696', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (174, 'noodle.webp', NULL, NULL, 1184, 647, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697911192/large_noodle_e82cbf65c5.webp", "hash": "large_noodle_e82cbf65c5", "mime": "image/webp", "name": "large_noodle.webp", "path": null, "size": 23.91, "width": 1000, "height": 546, "provider_metadata": {"public_id": "large_noodle_e82cbf65c5", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697911192/small_noodle_e82cbf65c5.webp", "hash": "small_noodle_e82cbf65c5", "mime": "image/webp", "name": "small_noodle.webp", "path": null, "size": 9.76, "width": 500, "height": 273, "provider_metadata": {"public_id": "small_noodle_e82cbf65c5", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697911192/medium_noodle_e82cbf65c5.webp", "hash": "medium_noodle_e82cbf65c5", "mime": "image/webp", "name": "medium_noodle.webp", "path": null, "size": 15.91, "width": 750, "height": 410, "provider_metadata": {"public_id": "medium_noodle_e82cbf65c5", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697911192/thumbnail_noodle_e82cbf65c5.webp", "hash": "thumbnail_noodle_e82cbf65c5", "mime": "image/webp", "name": "thumbnail_noodle.webp", "path": null, "size": 3.03, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_noodle_e82cbf65c5", "resource_type": "image"}}}', 'noodle_e82cbf65c5', '.webp', 'image/webp', 31.22, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697911192/noodle_e82cbf65c5.webp', NULL, 'cloudinary', '{"public_id": "noodle_e82cbf65c5", "resource_type": "image"}', '/6', '2023-10-21 17:59:52.783', '2023-10-21 17:59:52.783', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (88, 'signature-white.webp', NULL, NULL, 941, 189, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1693556940/small_signature_white_60dbdcd21f.webp", "hash": "small_signature_white_60dbdcd21f", "mime": "image/webp", "name": "small_signature-white.webp", "path": null, "size": 13.69, "width": 500, "height": 100, "provider_metadata": {"public_id": "small_signature_white_60dbdcd21f", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1693556940/medium_signature_white_60dbdcd21f.webp", "hash": "medium_signature_white_60dbdcd21f", "mime": "image/webp", "name": "medium_signature-white.webp", "path": null, "size": 22.75, "width": 750, "height": 151, "provider_metadata": {"public_id": "medium_signature_white_60dbdcd21f", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1693556940/thumbnail_signature_white_60dbdcd21f.webp", "hash": "thumbnail_signature_white_60dbdcd21f", "mime": "image/webp", "name": "thumbnail_signature-white.webp", "path": null, "size": 5.83, "width": 245, "height": 49, "provider_metadata": {"public_id": "thumbnail_signature_white_60dbdcd21f", "resource_type": "image"}}}', 'signature_white_60dbdcd21f', '.webp', 'image/webp', 21.08, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1693556940/signature_white_60dbdcd21f.webp', NULL, 'cloudinary', '{"public_id": "signature_white_60dbdcd21f", "resource_type": "image"}', '/11', '2023-09-01 08:29:00.774', '2023-09-01 08:29:00.774', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (93, 'dove_nessuno_guarda.jpg', NULL, NULL, 700, 700, '{"small": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694546793/small_dove_nessuno_guarda_ec1a6ad112.jpg", "hash": "small_dove_nessuno_guarda_ec1a6ad112", "mime": "image/jpeg", "name": "small_dove_nessuno_guarda.jpg", "path": null, "size": 80.99, "width": 500, "height": 500, "provider_metadata": {"public_id": "small_dove_nessuno_guarda_ec1a6ad112", "resource_type": "image"}}, "thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694546793/thumbnail_dove_nessuno_guarda_ec1a6ad112.jpg", "hash": "thumbnail_dove_nessuno_guarda_ec1a6ad112", "mime": "image/jpeg", "name": "thumbnail_dove_nessuno_guarda.jpg", "path": null, "size": 10.6, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_dove_nessuno_guarda_ec1a6ad112", "resource_type": "image"}}}', 'dove_nessuno_guarda_ec1a6ad112', '.jpg', 'image/jpeg', 148.32, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1694546793/dove_nessuno_guarda_ec1a6ad112.jpg', NULL, 'cloudinary', '{"public_id": "dove_nessuno_guarda_ec1a6ad112", "resource_type": "image"}', '/2', '2023-09-12 19:26:34.396', '2023-09-12 19:26:34.396', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (89, 'aoc.webp', NULL, NULL, 1200, 655, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694340967/large_aoc_7a1ccad4f3.webp", "hash": "large_aoc_7a1ccad4f3", "mime": "image/webp", "name": "large_aoc.webp", "path": null, "size": 13.39, "width": 1000, "height": 546, "provider_metadata": {"public_id": "large_aoc_7a1ccad4f3", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694340967/small_aoc_7a1ccad4f3.webp", "hash": "small_aoc_7a1ccad4f3", "mime": "image/webp", "name": "small_aoc.webp", "path": null, "size": 6.71, "width": 500, "height": 273, "provider_metadata": {"public_id": "small_aoc_7a1ccad4f3", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694340967/medium_aoc_7a1ccad4f3.webp", "hash": "medium_aoc_7a1ccad4f3", "mime": "image/webp", "name": "medium_aoc.webp", "path": null, "size": 9.91, "width": 750, "height": 409, "provider_metadata": {"public_id": "medium_aoc_7a1ccad4f3", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694340967/thumbnail_aoc_7a1ccad4f3.webp", "hash": "thumbnail_aoc_7a1ccad4f3", "mime": "image/webp", "name": "thumbnail_aoc.webp", "path": null, "size": 2.94, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_aoc_7a1ccad4f3", "resource_type": "image"}}}', 'aoc_7a1ccad4f3', '.webp', 'image/webp', 19.24, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1694340967/aoc_7a1ccad4f3.webp', NULL, 'cloudinary', '{"public_id": "aoc_7a1ccad4f3", "resource_type": "image"}', '/6', '2023-09-10 10:16:08.449', '2023-09-10 10:16:08.449', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (91, 'gdpr.webp', NULL, NULL, 860, 470, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694341701/small_gdpr_7982d8d94d.webp", "hash": "small_gdpr_7982d8d94d", "mime": "image/webp", "name": "small_gdpr.webp", "path": null, "size": 17.75, "width": 500, "height": 273, "provider_metadata": {"public_id": "small_gdpr_7982d8d94d", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694341701/medium_gdpr_7982d8d94d.webp", "hash": "medium_gdpr_7982d8d94d", "mime": "image/webp", "name": "medium_gdpr.webp", "path": null, "size": 30.85, "width": 750, "height": 410, "provider_metadata": {"public_id": "medium_gdpr_7982d8d94d", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694341700/thumbnail_gdpr_7982d8d94d.webp", "hash": "thumbnail_gdpr_7982d8d94d", "mime": "image/webp", "name": "thumbnail_gdpr.webp", "path": null, "size": 6.33, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_gdpr_7982d8d94d", "resource_type": "image"}}}', 'gdpr_7982d8d94d', '.webp', 'image/webp', 44.16, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1694341701/gdpr_7982d8d94d.webp', NULL, 'cloudinary', '{"public_id": "gdpr_7982d8d94d", "resource_type": "image"}', '/6', '2023-09-10 10:28:21.453', '2023-09-10 10:28:21.453', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (90, 'fc_app.webp', NULL, NULL, 616, 336, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694341128/small_fc_app_869a56c53d.webp", "hash": "small_fc_app_869a56c53d", "mime": "image/webp", "name": "small_fc_app.webp", "path": null, "size": 17.42, "width": 500, "height": 273, "provider_metadata": {"public_id": "small_fc_app_869a56c53d", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694341128/thumbnail_fc_app_869a56c53d.webp", "hash": "thumbnail_fc_app_869a56c53d", "mime": "image/webp", "name": "thumbnail_fc_app.webp", "path": null, "size": 6.88, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_fc_app_869a56c53d", "resource_type": "image"}}}', 'fc_app_869a56c53d', '.webp', 'image/webp', 25.18, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1694341128/fc_app_869a56c53d.webp', NULL, 'cloudinary', '{"public_id": "fc_app_869a56c53d", "resource_type": "image"}', '/6', '2023-09-10 10:18:48.646', '2023-09-10 19:03:09.441', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (2, 'bjss.webp', NULL, NULL, 280, 150, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692645367/thumbnail_bjss_180dc7fdd7.webp", "hash": "thumbnail_bjss_180dc7fdd7", "mime": "image/webp", "name": "thumbnail_bjss.webp", "path": null, "size": 5.04, "width": 245, "height": 131, "provider_metadata": {"public_id": "thumbnail_bjss_180dc7fdd7", "resource_type": "image"}}}', 'bjss_180dc7fdd7', '.webp', 'image/webp', 4.53, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692645367/bjss_180dc7fdd7.webp', NULL, 'cloudinary', '{"public_id": "bjss_180dc7fdd7", "resource_type": "image"}', '/', '2023-08-21 19:16:08.111', '2023-08-21 19:16:08.111', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (94, 'bjss.jpeg', NULL, NULL, 200, 200, '{"thumbnail": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694634412/thumbnail_bjss_276df2a44a.jpg", "hash": "thumbnail_bjss_276df2a44a", "mime": "image/jpeg", "name": "thumbnail_bjss.jpeg", "path": null, "size": 2.33, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_bjss_276df2a44a", "resource_type": "image"}}}', 'bjss_276df2a44a', '.jpeg', 'image/jpeg', 3.35, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1694634412/bjss_276df2a44a.jpg', NULL, 'cloudinary', '{"public_id": "bjss_276df2a44a", "resource_type": "image"}', '/9', '2023-09-13 19:46:53.192', '2023-09-13 19:46:53.192', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (96, 'Pancaldi_CV_aug23-2.webp', NULL, NULL, 2480, 3508, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694635077/large_Pancaldi_CV_aug23_2_a0f5e64791.webp", "hash": "large_Pancaldi_CV_aug23_2_a0f5e64791", "mime": "image/webp", "name": "large_Pancaldi_CV_aug23-2.webp", "path": null, "size": 48.78, "width": 707, "height": 1000, "provider_metadata": {"public_id": "large_Pancaldi_CV_aug23_2_a0f5e64791", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694635077/small_Pancaldi_CV_aug23_2_a0f5e64791.webp", "hash": "small_Pancaldi_CV_aug23_2_a0f5e64791", "mime": "image/webp", "name": "small_Pancaldi_CV_aug23-2.webp", "path": null, "size": 14.49, "width": 353, "height": 500, "provider_metadata": {"public_id": "small_Pancaldi_CV_aug23_2_a0f5e64791", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694635077/medium_Pancaldi_CV_aug23_2_a0f5e64791.webp", "hash": "medium_Pancaldi_CV_aug23_2_a0f5e64791", "mime": "image/webp", "name": "medium_Pancaldi_CV_aug23-2.webp", "path": null, "size": 30.71, "width": 530, "height": 750, "provider_metadata": {"public_id": "medium_Pancaldi_CV_aug23_2_a0f5e64791", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694635077/thumbnail_Pancaldi_CV_aug23_2_a0f5e64791.webp", "hash": "thumbnail_Pancaldi_CV_aug23_2_a0f5e64791", "mime": "image/webp", "name": "thumbnail_Pancaldi_CV_aug23-2.webp", "path": null, "size": 1.63, "width": 110, "height": 156, "provider_metadata": {"public_id": "thumbnail_Pancaldi_CV_aug23_2_a0f5e64791", "resource_type": "image"}}}', 'Pancaldi_CV_aug23_2_a0f5e64791', '.webp', 'image/webp', 246.27, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1694635077/Pancaldi_CV_aug23_2_a0f5e64791.webp', NULL, 'cloudinary', '{"public_id": "Pancaldi_CV_aug23_2_a0f5e64791", "resource_type": "image"}', '/8', '2023-09-13 19:57:57.915', '2023-09-13 19:57:57.915', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (92, 'website.webp', NULL, NULL, 1683, 919, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694341701/large_website_867433c5d7.webp", "hash": "large_website_867433c5d7", "mime": "image/webp", "name": "large_website.webp", "path": null, "size": 45.38, "width": 1000, "height": 546, "provider_metadata": {"public_id": "large_website_867433c5d7", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694341701/small_website_867433c5d7.webp", "hash": "small_website_867433c5d7", "mime": "image/webp", "name": "small_website.webp", "path": null, "size": 15.09, "width": 500, "height": 273, "provider_metadata": {"public_id": "small_website_867433c5d7", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694341701/medium_website_867433c5d7.webp", "hash": "medium_website_867433c5d7", "mime": "image/webp", "name": "medium_website.webp", "path": null, "size": 29.11, "width": 750, "height": 410, "provider_metadata": {"public_id": "medium_website_867433c5d7", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694341701/thumbnail_website_867433c5d7.webp", "hash": "thumbnail_website_867433c5d7", "mime": "image/webp", "name": "thumbnail_website.webp", "path": null, "size": 4.49, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_website_867433c5d7", "resource_type": "image"}}}', 'website_867433c5d7', '.webp', 'image/webp', 101.09, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1694341701/website_867433c5d7.webp', NULL, 'cloudinary', '{"public_id": "website_867433c5d7", "resource_type": "image"}', '/6', '2023-09-10 10:28:22.151', '2023-09-10 10:28:22.151', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (10, 'uom.webp', NULL, NULL, 400, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692723652/thumbnail_uom_9c1bfed3b5.webp", "hash": "thumbnail_uom_9c1bfed3b5", "mime": "image/webp", "name": "thumbnail_uom.webp", "path": null, "size": 1.48, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_uom_9c1bfed3b5", "resource_type": "image"}}}', 'uom_9c1bfed3b5', '.webp', 'image/webp', 2.47, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692723652/uom_9c1bfed3b5.webp', NULL, 'cloudinary', '{"public_id": "uom_9c1bfed3b5", "resource_type": "image"}', '/9', '2023-08-22 17:00:54.376', '2023-08-22 17:00:54.376', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (11, 'unibz-cs.webp', NULL, NULL, 225, 225, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692723921/thumbnail_unibz_cs_5f8e5afb06.webp", "hash": "thumbnail_unibz_cs_5f8e5afb06", "mime": "image/webp", "name": "thumbnail_unibz-cs.webp", "path": null, "size": 1.36, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_unibz_cs_5f8e5afb06", "resource_type": "image"}}}', 'unibz_cs_5f8e5afb06', '.webp', 'image/webp', 1.87, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692723921/unibz_cs_5f8e5afb06.webp', NULL, 'cloudinary', '{"public_id": "unibz_cs_5f8e5afb06", "resource_type": "image"}', '/9', '2023-08-22 17:05:22.095', '2023-08-22 17:05:22.095', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (12, 'cofc.webp', NULL, NULL, 100, 100, NULL, 'cofc_c23d3bb7f0', '.webp', 'image/webp', 2.64, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692724050/cofc_c23d3bb7f0.webp', NULL, 'cloudinary', '{"public_id": "cofc_c23d3bb7f0", "resource_type": "image"}', '/9', '2023-08-22 17:07:30.46', '2023-08-22 17:07:30.46', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (13, 'peri.webp', NULL, NULL, 100, 100, NULL, 'peri_cff6e0b397', '.webp', 'image/webp', 1.67, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692724050/peri_cff6e0b397.webp', NULL, 'cloudinary', '{"public_id": "peri_cff6e0b397", "resource_type": "image"}', '/9', '2023-08-22 17:07:30.73', '2023-08-22 17:07:30.73', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (3, 'booking.png', NULL, NULL, 920, 900, '{"small": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692645590/small_booking_c2c27e91e2.png", "hash": "small_booking_c2c27e91e2", "mime": "image/png", "name": "small_booking.png", "path": null, "size": 23.42, "width": 500, "height": 489, "provider_metadata": {"public_id": "small_booking_c2c27e91e2", "resource_type": "image"}}, "medium": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692645590/medium_booking_c2c27e91e2.png", "hash": "medium_booking_c2c27e91e2", "mime": "image/png", "name": "medium_booking.png", "path": null, "size": 41.48, "width": 750, "height": 734, "provider_metadata": {"public_id": "medium_booking_c2c27e91e2", "resource_type": "image"}}, "thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692645590/thumbnail_booking_c2c27e91e2.png", "hash": "thumbnail_booking_c2c27e91e2", "mime": "image/png", "name": "thumbnail_booking.png", "path": null, "size": 5.28, "width": 159, "height": 156, "provider_metadata": {"public_id": "thumbnail_booking_c2c27e91e2", "resource_type": "image"}}}', 'booking_c2c27e91e2', '.png', 'image/png', 6.89, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692645590/booking_c2c27e91e2.png', NULL, 'cloudinary', '{"public_id": "booking_c2c27e91e2", "resource_type": "image"}', '/9', '2023-08-21 19:19:50.8', '2023-08-21 19:19:50.8', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (4, 'unibz.webp', NULL, NULL, 1200, 1200, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692645740/large_unibz_17557d79d6.webp", "hash": "large_unibz_17557d79d6", "mime": "image/webp", "name": "large_unibz.webp", "path": null, "size": 6.68, "width": 1000, "height": 1000, "provider_metadata": {"public_id": "large_unibz_17557d79d6", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692645740/small_unibz_17557d79d6.webp", "hash": "small_unibz_17557d79d6", "mime": "image/webp", "name": "small_unibz.webp", "path": null, "size": 3.35, "width": 500, "height": 500, "provider_metadata": {"public_id": "small_unibz_17557d79d6", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692645740/medium_unibz_17557d79d6.webp", "hash": "medium_unibz_17557d79d6", "mime": "image/webp", "name": "medium_unibz.webp", "path": null, "size": 4.97, "width": 750, "height": 750, "provider_metadata": {"public_id": "medium_unibz_17557d79d6", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692645740/thumbnail_unibz_17557d79d6.webp", "hash": "thumbnail_unibz_17557d79d6", "mime": "image/webp", "name": "thumbnail_unibz.webp", "path": null, "size": 1.42, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_unibz_17557d79d6", "resource_type": "image"}}}', 'unibz_17557d79d6', '.webp', 'image/webp', 3.61, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692645740/unibz_17557d79d6.webp', NULL, 'cloudinary', '{"public_id": "unibz_17557d79d6", "resource_type": "image"}', '/9', '2023-08-21 19:22:20.849', '2023-08-21 19:22:20.849', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (95, 'Pancaldi_CV_aug23.pdf', NULL, NULL, NULL, NULL, NULL, 'Pancaldi_CV_aug23_258811b6b1', '.pdf', 'application/pdf', 299.80, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1694634540/Pancaldi_CV_aug23_258811b6b1.pdf', NULL, 'cloudinary', '{"public_id": "Pancaldi_CV_aug23_258811b6b1", "resource_type": "image"}', '/8', '2023-09-13 19:49:00.729', '2023-09-13 19:49:00.729', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (97, 'Pancaldi_CV_aug23-1.webp', NULL, NULL, 2480, 3508, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694635078/large_Pancaldi_CV_aug23_1_103473c4e7.webp", "hash": "large_Pancaldi_CV_aug23_1_103473c4e7", "mime": "image/webp", "name": "large_Pancaldi_CV_aug23-1.webp", "path": null, "size": 106.25, "width": 707, "height": 1000, "provider_metadata": {"public_id": "large_Pancaldi_CV_aug23_1_103473c4e7", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694635078/small_Pancaldi_CV_aug23_1_103473c4e7.webp", "hash": "small_Pancaldi_CV_aug23_1_103473c4e7", "mime": "image/webp", "name": "small_Pancaldi_CV_aug23-1.webp", "path": null, "size": 33.18, "width": 353, "height": 500, "provider_metadata": {"public_id": "small_Pancaldi_CV_aug23_1_103473c4e7", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694635078/medium_Pancaldi_CV_aug23_1_103473c4e7.webp", "hash": "medium_Pancaldi_CV_aug23_1_103473c4e7", "mime": "image/webp", "name": "medium_Pancaldi_CV_aug23-1.webp", "path": null, "size": 66.76, "width": 530, "height": 750, "provider_metadata": {"public_id": "medium_Pancaldi_CV_aug23_1_103473c4e7", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694635077/thumbnail_Pancaldi_CV_aug23_1_103473c4e7.webp", "hash": "thumbnail_Pancaldi_CV_aug23_1_103473c4e7", "mime": "image/webp", "name": "thumbnail_Pancaldi_CV_aug23-1.webp", "path": null, "size": 3.7, "width": 110, "height": 156, "provider_metadata": {"public_id": "thumbnail_Pancaldi_CV_aug23_1_103473c4e7", "resource_type": "image"}}}', 'Pancaldi_CV_aug23_1_103473c4e7', '.webp', 'image/webp', 515.12, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1694635077/Pancaldi_CV_aug23_1_103473c4e7.webp', NULL, 'cloudinary', '{"public_id": "Pancaldi_CV_aug23_1_103473c4e7", "resource_type": "image"}', '/8', '2023-09-13 19:57:58.82', '2023-09-13 19:57:58.82', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (98, 'Pancaldi_CV_aug23.webp', NULL, NULL, 2480, 2215, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694635671/large_Pancaldi_CV_aug23_77a1e29cab.webp", "hash": "large_Pancaldi_CV_aug23_77a1e29cab", "mime": "image/webp", "name": "large_Pancaldi_CV_aug23.webp", "path": null, "size": 82.27, "width": 1000, "height": 893, "provider_metadata": {"public_id": "large_Pancaldi_CV_aug23_77a1e29cab", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694635671/small_Pancaldi_CV_aug23_77a1e29cab.webp", "hash": "small_Pancaldi_CV_aug23_77a1e29cab", "mime": "image/webp", "name": "small_Pancaldi_CV_aug23.webp", "path": null, "size": 28.49, "width": 500, "height": 447, "provider_metadata": {"public_id": "small_Pancaldi_CV_aug23_77a1e29cab", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694635671/medium_Pancaldi_CV_aug23_77a1e29cab.webp", "hash": "medium_Pancaldi_CV_aug23_77a1e29cab", "mime": "image/webp", "name": "medium_Pancaldi_CV_aug23.webp", "path": null, "size": 54.92, "width": 750, "height": 670, "provider_metadata": {"public_id": "medium_Pancaldi_CV_aug23_77a1e29cab", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694635670/thumbnail_Pancaldi_CV_aug23_77a1e29cab.webp", "hash": "thumbnail_Pancaldi_CV_aug23_77a1e29cab", "mime": "image/webp", "name": "thumbnail_Pancaldi_CV_aug23.webp", "path": null, "size": 4.07, "width": 175, "height": 156, "provider_metadata": {"public_id": "thumbnail_Pancaldi_CV_aug23_77a1e29cab", "resource_type": "image"}}}', 'Pancaldi_CV_aug23_77a1e29cab', '.webp', 'image/webp', 250.28, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1694635671/Pancaldi_CV_aug23_77a1e29cab.webp', NULL, 'cloudinary', '{"public_id": "Pancaldi_CV_aug23_77a1e29cab", "resource_type": "image"}', '/8', '2023-09-13 20:07:52.29', '2023-09-13 20:07:52.29', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (84, 'avatar-md.png', NULL, NULL, 553, 553, '{"small": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1693038097/small_avatar_md_292b112d97.png", "hash": "small_avatar_md_292b112d97", "mime": "image/png", "name": "small_avatar-md.png", "path": null, "size": 443.23, "width": 500, "height": 500, "provider_metadata": {"public_id": "small_avatar_md_292b112d97", "resource_type": "image"}}, "thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1693038096/thumbnail_avatar_md_292b112d97.png", "hash": "thumbnail_avatar_md_292b112d97", "mime": "image/png", "name": "thumbnail_avatar-md.png", "path": null, "size": 54.63, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_avatar_md_292b112d97", "resource_type": "image"}}}', 'avatar_md_292b112d97', '.png', 'image/png', 148.51, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1693038096/avatar_md_292b112d97.png', NULL, 'cloudinary', '{"public_id": "avatar_md_292b112d97", "resource_type": "image"}', '/11', '2023-08-26 08:21:37.798', '2023-08-26 08:21:37.798', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (85, 'signature.webp', NULL, NULL, 941, 189, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1693066829/small_signature_b64d54de16.webp", "hash": "small_signature_b64d54de16", "mime": "image/webp", "name": "small_signature.webp", "path": null, "size": 10.29, "width": 500, "height": 100, "provider_metadata": {"public_id": "small_signature_b64d54de16", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1693066829/medium_signature_b64d54de16.webp", "hash": "medium_signature_b64d54de16", "mime": "image/webp", "name": "medium_signature.webp", "path": null, "size": 18.02, "width": 750, "height": 151, "provider_metadata": {"public_id": "medium_signature_b64d54de16", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1693066829/thumbnail_signature_b64d54de16.webp", "hash": "thumbnail_signature_b64d54de16", "mime": "image/webp", "name": "thumbnail_signature.webp", "path": null, "size": 3.96, "width": 245, "height": 49, "provider_metadata": {"public_id": "thumbnail_signature_b64d54de16", "resource_type": "image"}}}', 'signature_b64d54de16', '.webp', 'image/webp', 14.21, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1693066829/signature_b64d54de16.webp', NULL, 'cloudinary', '{"public_id": "signature_b64d54de16", "resource_type": "image"}', '/11', '2023-08-26 16:20:30.266', '2023-08-26 16:20:30.266', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (99, 'avatar-md-nobg.png', NULL, NULL, 553, 553, '{"small": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694699676/small_avatar_md_nobg_ef5553f75b.png", "hash": "small_avatar_md_nobg_ef5553f75b", "mime": "image/png", "name": "small_avatar-md-nobg.png", "path": null, "size": 272.59, "width": 500, "height": 500, "provider_metadata": {"public_id": "small_avatar_md_nobg_ef5553f75b", "resource_type": "image"}}, "thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1694699676/thumbnail_avatar_md_nobg_ef5553f75b.png", "hash": "thumbnail_avatar_md_nobg_ef5553f75b", "mime": "image/png", "name": "thumbnail_avatar-md-nobg.png", "path": null, "size": 34.56, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_avatar_md_nobg_ef5553f75b", "resource_type": "image"}}}', 'avatar_md_nobg_ef5553f75b', '.png', 'image/png', 86.37, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1694699676/avatar_md_nobg_ef5553f75b.png', NULL, 'cloudinary', '{"public_id": "avatar_md_nobg_ef5553f75b", "resource_type": "image"}', '/11', '2023-09-14 13:54:36.834', '2023-09-14 13:54:36.834', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (100, 'tos.png', NULL, NULL, 264, 352, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1695222479/thumbnail_tos_293374a28f.png", "hash": "thumbnail_tos_293374a28f", "mime": "image/png", "name": "thumbnail_tos.png", "path": null, "size": 45.81, "width": 117, "height": 156, "provider_metadata": {"public_id": "thumbnail_tos_293374a28f", "resource_type": "image"}}}', 'tos_293374a28f', '.png', 'image/png', 49.64, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1695222479/tos_293374a28f.png', NULL, 'cloudinary', '{"public_id": "tos_293374a28f", "resource_type": "image"}', '/4', '2023-09-20 15:08:00.153', '2023-09-20 15:08:27.205', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (101, 'good-omens.jpg', NULL, NULL, 300, 444, '{"thumbnail": {"ext": ".jpg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696710673/thumbnail_good_omens_32a5dca90b.jpg", "hash": "thumbnail_good_omens_32a5dca90b", "mime": "image/jpeg", "name": "thumbnail_good-omens.jpg", "path": null, "size": 5.83, "width": 105, "height": 156, "provider_metadata": {"public_id": "thumbnail_good_omens_32a5dca90b", "resource_type": "image"}}}', 'good_omens_32a5dca90b', '.jpg', 'image/jpeg', 28.65, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696710673/good_omens_32a5dca90b.jpg', NULL, 'cloudinary', '{"public_id": "good_omens_32a5dca90b", "resource_type": "image"}', '/3', '2023-10-07 20:31:14.242', '2023-10-07 20:31:14.242', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (102, 'stories.jpeg', NULL, NULL, 225, 225, '{"thumbnail": {"ext": ".jpeg", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696710941/thumbnail_stories_7c68c54fe5.jpg", "hash": "thumbnail_stories_7c68c54fe5", "mime": "image/jpeg", "name": "thumbnail_stories.jpeg", "path": null, "size": 6.25, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_stories_7c68c54fe5", "resource_type": "image"}}}', 'stories_7c68c54fe5', '.jpeg', 'image/jpeg', 8.10, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696710941/stories_7c68c54fe5.jpg', NULL, 'cloudinary', '{"public_id": "stories_7c68c54fe5", "resource_type": "image"}', '/2', '2023-10-07 20:35:41.43', '2023-10-07 20:35:41.43', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (175, 'martacodes.webp', NULL, NULL, 1346, 735, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697913493/large_martacodes_015d03d33b.webp", "hash": "large_martacodes_015d03d33b", "mime": "image/webp", "name": "large_martacodes.webp", "path": null, "size": 25.01, "width": 1000, "height": 546, "provider_metadata": {"public_id": "large_martacodes_015d03d33b", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697913493/small_martacodes_015d03d33b.webp", "hash": "small_martacodes_015d03d33b", "mime": "image/webp", "name": "small_martacodes.webp", "path": null, "size": 10.56, "width": 500, "height": 273, "provider_metadata": {"public_id": "small_martacodes_015d03d33b", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697913493/medium_martacodes_015d03d33b.webp", "hash": "medium_martacodes_015d03d33b", "mime": "image/webp", "name": "medium_martacodes.webp", "path": null, "size": 17.72, "width": 750, "height": 410, "provider_metadata": {"public_id": "medium_martacodes_015d03d33b", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697913493/thumbnail_martacodes_015d03d33b.webp", "hash": "thumbnail_martacodes_015d03d33b", "mime": "image/webp", "name": "thumbnail_martacodes.webp", "path": null, "size": 3.73, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_martacodes_015d03d33b", "resource_type": "image"}}}', 'martacodes_015d03d33b', '.webp', 'image/webp', 39.22, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697913493/martacodes_015d03d33b.webp', NULL, 'cloudinary', '{"public_id": "martacodes_015d03d33b", "resource_type": "image"}', '/6', '2023-10-21 18:38:13.845', '2023-10-21 18:38:13.845', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (103, 'maven.svg', NULL, NULL, 800, 800, NULL, 'maven_e5be04370e', '.svg', 'image/svg+xml', 15.19, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696711479/maven_e5be04370e.svg', NULL, 'cloudinary', '{"public_id": "maven_e5be04370e", "resource_type": "image"}', '/7', '2023-10-07 20:44:40.776', '2023-10-07 20:44:40.776', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (104, 'spring.svg', NULL, NULL, 2499, 2500, NULL, 'spring_a0dfb49d97', '.svg', 'image/svg+xml', 0.86, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696711479/spring_a0dfb49d97.svg', NULL, 'cloudinary', '{"public_id": "spring_a0dfb49d97", "resource_type": "image"}', '/7', '2023-10-07 20:44:40.987', '2023-10-07 20:44:40.987', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (106, 'gradle.svg', NULL, NULL, 800, 800, NULL, 'gradle_1158229270', '.svg', 'image/svg+xml', 1.42, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696711851/gradle_1158229270.svg', NULL, 'cloudinary', '{"public_id": "gradle_1158229270", "resource_type": "image"}', '/7', '2023-10-07 20:50:52.367', '2023-10-07 20:50:52.367', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (107, 'django.webp', NULL, NULL, 200, 200, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696712057/thumbnail_django_e7371c1638.webp", "hash": "thumbnail_django_e7371c1638", "mime": "image/webp", "name": "thumbnail_django.webp", "path": null, "size": 1.24, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_django_e7371c1638", "resource_type": "image"}}}', 'django_e7371c1638', '.webp', 'image/webp', 1.30, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696712057/django_e7371c1638.webp', NULL, 'cloudinary', '{"public_id": "django_e7371c1638", "resource_type": "image"}', '/7', '2023-10-07 20:54:18.001', '2023-10-07 20:54:18.001', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (176, 'moro.png', NULL, NULL, 500, 500, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1698426363/thumbnail_moro_fe4b20b0b4.png", "hash": "thumbnail_moro_fe4b20b0b4", "mime": "image/png", "name": "thumbnail_moro.png", "path": null, "size": 33.91, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_moro_fe4b20b0b4", "resource_type": "image"}}}', 'moro_fe4b20b0b4', '.png', 'image/png', 92.50, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1698426363/moro_fe4b20b0b4.png', NULL, 'cloudinary', '{"public_id": "moro_fe4b20b0b4", "resource_type": "image"}', '/9', '2023-10-27 17:06:03.826', '2023-10-27 17:06:03.826', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (110, 'node.webp', NULL, NULL, 211, 238, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696712637/thumbnail_node_29ccc211e8.webp", "hash": "thumbnail_node_29ccc211e8", "mime": "image/webp", "name": "thumbnail_node.webp", "path": null, "size": 2.36, "width": 138, "height": 156, "provider_metadata": {"public_id": "thumbnail_node_29ccc211e8", "resource_type": "image"}}}', 'node_29ccc211e8', '.webp', 'image/webp', 2.81, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696712637/node_29ccc211e8.webp', NULL, 'cloudinary', '{"public_id": "node_29ccc211e8", "resource_type": "image"}', '/7', '2023-10-07 21:03:57.512', '2023-10-07 21:03:57.512', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (112, 'express.png', NULL, NULL, 512, 512, '{"small": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696712637/small_express_84d144152a.png", "hash": "small_express_84d144152a", "mime": "image/png", "name": "small_express.png", "path": null, "size": 19.64, "width": 500, "height": 500, "provider_metadata": {"public_id": "small_express_84d144152a", "resource_type": "image"}}, "thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696712637/thumbnail_express_84d144152a.png", "hash": "thumbnail_express_84d144152a", "mime": "image/png", "name": "thumbnail_express.png", "path": null, "size": 4.74, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_express_84d144152a", "resource_type": "image"}}}', 'express_84d144152a', '.png', 'image/png', 4.79, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696712637/express_84d144152a.png', NULL, 'cloudinary', '{"public_id": "express_84d144152a", "resource_type": "image"}', '/7', '2023-10-07 21:03:57.58', '2023-10-07 21:03:57.58', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (114, 'react.svg', NULL, NULL, 128, 128, NULL, 'react_3b5b377da6', '.svg', 'image/svg+xml', 2.45, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696713208/react_3b5b377da6.svg', NULL, 'cloudinary', '{"public_id": "react_3b5b377da6", "resource_type": "image"}', '/7', '2023-10-07 21:13:29.494', '2023-10-07 21:13:29.494', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (115, 'vue.svg', NULL, NULL, 128, 128, NULL, 'vue_64915775d7', '.svg', 'image/svg+xml', 0.56, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696713208/vue_64915775d7.svg', NULL, 'cloudinary', '{"public_id": "vue_64915775d7", "resource_type": "image"}', '/7', '2023-10-07 21:13:29.537', '2023-10-07 21:13:29.537', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (116, 'angular.svg', NULL, NULL, 128, 128, NULL, 'angular_dd886eccd9', '.svg', 'image/svg+xml', 0.63, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696713208/angular_dd886eccd9.svg', NULL, 'cloudinary', '{"public_id": "angular_dd886eccd9", "resource_type": "image"}', '/7', '2023-10-07 21:13:29.806', '2023-10-07 21:13:29.806', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (117, 'next-js.svg', NULL, NULL, 1024, 1024, NULL, 'next_js_5f11aa66e2', '.svg', 'image/svg+xml', 1.53, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696713208/next_js_5f11aa66e2.svg', NULL, 'cloudinary', '{"public_id": "next_js_5f11aa66e2", "resource_type": "image"}', '/7', '2023-10-07 21:13:30.039', '2023-10-07 21:13:30.039', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (118, 'redux.svg', NULL, NULL, 128, 128, NULL, 'redux_4c767ea687', '.svg', 'image/svg+xml', 1.22, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696713457/redux_4c767ea687.svg', NULL, 'cloudinary', '{"public_id": "redux_4c767ea687", "resource_type": "image"}', '/7', '2023-10-07 21:17:39.176', '2023-10-07 21:17:39.176', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (120, 'typescript.svg', NULL, NULL, 128, 128, NULL, 'typescript_96b03c0224', '.svg', 'image/svg+xml', 0.94, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696713740/typescript_96b03c0224.svg', NULL, 'cloudinary', '{"public_id": "typescript_96b03c0224", "resource_type": "image"}', '/7', '2023-10-07 21:22:21.652', '2023-10-07 21:22:21.652', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (121, 'javascript.svg', NULL, NULL, 128, 128, NULL, 'javascript_f76197a46e', '.svg', 'image/svg+xml', 1.14, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696713740/javascript_f76197a46e.svg', NULL, 'cloudinary', '{"public_id": "javascript_f76197a46e", "resource_type": "image"}', '/7', '2023-10-07 21:22:21.695', '2023-10-07 21:22:21.695', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (122, 'php.webp', NULL, NULL, 711, 384, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696714068/small_php_611a336356.webp", "hash": "small_php_611a336356", "mime": "image/webp", "name": "small_php.webp", "path": null, "size": 10.71, "width": 500, "height": 270, "provider_metadata": {"public_id": "small_php_611a336356", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696714068/thumbnail_php_611a336356.webp", "hash": "thumbnail_php_611a336356", "mime": "image/webp", "name": "thumbnail_php.webp", "path": null, "size": 4.98, "width": 245, "height": 132, "provider_metadata": {"public_id": "thumbnail_php_611a336356", "resource_type": "image"}}}', 'php_611a336356', '.webp', 'image/webp', 11.76, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696714068/php_611a336356.webp', NULL, 'cloudinary', '{"public_id": "php_611a336356", "resource_type": "image"}', '/7', '2023-10-07 21:27:48.739', '2023-10-07 21:27:48.739', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (123, 'drupal.webp', NULL, NULL, 444, 512, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696714068/small_drupal_cb7613e947.webp", "hash": "small_drupal_cb7613e947", "mime": "image/webp", "name": "small_drupal.webp", "path": null, "size": 12.71, "width": 434, "height": 500, "provider_metadata": {"public_id": "small_drupal_cb7613e947", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696714068/thumbnail_drupal_cb7613e947.webp", "hash": "thumbnail_drupal_cb7613e947", "mime": "image/webp", "name": "thumbnail_drupal.webp", "path": null, "size": 3.64, "width": 135, "height": 156, "provider_metadata": {"public_id": "thumbnail_drupal_cb7613e947", "resource_type": "image"}}}', 'drupal_cb7613e947', '.webp', 'image/webp', 11.93, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696714068/drupal_cb7613e947.webp', NULL, 'cloudinary', '{"public_id": "drupal_cb7613e947", "resource_type": "image"}', '/7', '2023-10-07 21:27:48.856', '2023-10-07 21:27:48.856', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (124, 'php.png', NULL, NULL, 500, 500, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696714588/thumbnail_php_cccf8636e8.png", "hash": "thumbnail_php_cccf8636e8", "mime": "image/png", "name": "thumbnail_php.png", "path": null, "size": 12.34, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_php_cccf8636e8", "resource_type": "image"}}}', 'php_cccf8636e8', '.png', 'image/png', 10.10, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696714588/php_cccf8636e8.png', NULL, 'cloudinary', '{"public_id": "php_cccf8636e8", "resource_type": "image"}', '/7', '2023-10-07 21:36:28.814', '2023-10-07 21:36:28.814', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (125, 'materialui.svg', NULL, NULL, 128, 128, NULL, 'materialui_ef01fffc1f', '.svg', 'image/svg+xml', 0.35, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696714818/materialui_ef01fffc1f.svg', NULL, 'cloudinary', '{"public_id": "materialui_ef01fffc1f", "resource_type": "image"}', '/7', '2023-10-07 21:40:19.76', '2023-10-07 21:40:19.76', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (126, 'tailwindcss.svg', NULL, NULL, 128, 128, NULL, 'tailwindcss_75e4f1c53a', '.svg', 'image/svg+xml', 0.69, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696714818/tailwindcss_75e4f1c53a.svg', NULL, 'cloudinary', '{"public_id": "tailwindcss_75e4f1c53a", "resource_type": "image"}', '/7', '2023-10-07 21:40:19.876', '2023-10-07 21:40:19.876', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (127, 'sass.svg', NULL, NULL, 128, 128, NULL, 'sass_0b89a2d19a', '.svg', 'image/svg+xml', 5.50, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696714818/sass_0b89a2d19a.svg', NULL, 'cloudinary', '{"public_id": "sass_0b89a2d19a", "resource_type": "image"}', '/7', '2023-10-07 21:40:19.92', '2023-10-07 21:40:19.92', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (128, 'storybook.svg', NULL, NULL, 128, 128, NULL, 'storybook_628e0755cf', '.svg', 'image/svg+xml', 0.87, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696714818/storybook_628e0755cf.svg', NULL, 'cloudinary', '{"public_id": "storybook_628e0755cf", "resource_type": "image"}', '/7', '2023-10-07 21:40:19.928', '2023-10-07 21:40:19.928', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (129, 'html.svg', NULL, NULL, 128, 128, NULL, 'html_16f9f02d68', '.svg', 'image/svg+xml', 0.63, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696714818/html_16f9f02d68.svg', NULL, 'cloudinary', '{"public_id": "html_16f9f02d68", "resource_type": "image"}', '/7', '2023-10-07 21:40:19.992', '2023-10-07 21:40:19.992', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (130, 'css.svg', NULL, NULL, 128, 128, NULL, 'css_53852a3d50', '.svg', 'image/svg+xml', 0.84, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696714818/css_53852a3d50.svg', NULL, 'cloudinary', '{"public_id": "css_53852a3d50", "resource_type": "image"}', '/7', '2023-10-07 21:40:20.025', '2023-10-07 21:40:20.025', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (131, 'bootstrap.svg', NULL, NULL, 128, 128, NULL, 'bootstrap_2677c34a0a', '.svg', 'image/svg+xml', 1.17, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696714818/bootstrap_2677c34a0a.svg', NULL, 'cloudinary', '{"public_id": "bootstrap_2677c34a0a", "resource_type": "image"}', '/7', '2023-10-07 21:40:20.05', '2023-10-07 21:40:20.05', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (132, 'android.webp', NULL, NULL, 721, 639, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696714975/small_android_55c08b680d.webp", "hash": "small_android_55c08b680d", "mime": "image/webp", "name": "small_android.webp", "path": null, "size": 9.79, "width": 500, "height": 443, "provider_metadata": {"public_id": "small_android_55c08b680d", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696714975/thumbnail_android_55c08b680d.webp", "hash": "thumbnail_android_55c08b680d", "mime": "image/webp", "name": "thumbnail_android.webp", "path": null, "size": 3.24, "width": 176, "height": 156, "provider_metadata": {"public_id": "thumbnail_android_55c08b680d", "resource_type": "image"}}}', 'android_55c08b680d', '.webp', 'image/webp', 11.01, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696714975/android_55c08b680d.webp', NULL, 'cloudinary', '{"public_id": "android_55c08b680d", "resource_type": "image"}', '/7', '2023-10-07 21:42:55.705', '2023-10-07 21:42:55.705', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (133, 'kotlin.webp', NULL, NULL, 1024, 1024, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696714975/large_kotlin_d9dc247374.webp", "hash": "large_kotlin_d9dc247374", "mime": "image/webp", "name": "large_kotlin.webp", "path": null, "size": 16.97, "width": 1000, "height": 1000, "provider_metadata": {"public_id": "large_kotlin_d9dc247374", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696714975/small_kotlin_d9dc247374.webp", "hash": "small_kotlin_d9dc247374", "mime": "image/webp", "name": "small_kotlin.webp", "path": null, "size": 7.96, "width": 500, "height": 500, "provider_metadata": {"public_id": "small_kotlin_d9dc247374", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696714975/medium_kotlin_d9dc247374.webp", "hash": "medium_kotlin_d9dc247374", "mime": "image/webp", "name": "medium_kotlin.webp", "path": null, "size": 12.48, "width": 750, "height": 750, "provider_metadata": {"public_id": "medium_kotlin_d9dc247374", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696714975/thumbnail_kotlin_d9dc247374.webp", "hash": "thumbnail_kotlin_d9dc247374", "mime": "image/webp", "name": "thumbnail_kotlin.webp", "path": null, "size": 2.13, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_kotlin_d9dc247374", "resource_type": "image"}}}', 'kotlin_d9dc247374', '.webp', 'image/webp', 11.12, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696714975/kotlin_d9dc247374.webp', NULL, 'cloudinary', '{"public_id": "kotlin_d9dc247374", "resource_type": "image"}', '/7', '2023-10-07 21:42:56.074', '2023-10-07 21:42:56.074', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (135, 'nodejs.png', NULL, NULL, 266, 300, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696775209/thumbnail_nodejs_a68cd98b61.png", "hash": "thumbnail_nodejs_a68cd98b61", "mime": "image/png", "name": "thumbnail_nodejs.png", "path": null, "size": 10.58, "width": 138, "height": 156, "provider_metadata": {"public_id": "thumbnail_nodejs_a68cd98b61", "resource_type": "image"}}}', 'nodejs_a68cd98b61', '.png', 'image/png', 3.55, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696775209/nodejs_a68cd98b61.png', NULL, 'cloudinary', '{"public_id": "nodejs_a68cd98b61", "resource_type": "image"}', '/', '2023-10-08 14:26:49.436', '2023-10-08 14:26:49.436', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (136, 'java.png', NULL, NULL, 500, 500, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696775672/thumbnail_java_8e59afb564.png", "hash": "thumbnail_java_8e59afb564", "mime": "image/png", "name": "thumbnail_java.png", "path": null, "size": 10.1, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_java_8e59afb564", "resource_type": "image"}}}', 'java_8e59afb564', '.png', 'image/png', 5.90, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696775672/java_8e59afb564.png', NULL, 'cloudinary', '{"public_id": "java_8e59afb564", "resource_type": "image"}', '/', '2023-10-08 14:34:32.928', '2023-10-08 14:34:32.928', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (137, 'heroku.webp', NULL, NULL, 512, 512, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696776480/small_heroku_ec2c8556f9.webp", "hash": "small_heroku_ec2c8556f9", "mime": "image/webp", "name": "small_heroku.webp", "path": null, "size": 3.92, "width": 500, "height": 500, "provider_metadata": {"public_id": "small_heroku_ec2c8556f9", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696776480/thumbnail_heroku_ec2c8556f9.webp", "hash": "thumbnail_heroku_ec2c8556f9", "mime": "image/webp", "name": "thumbnail_heroku.webp", "path": null, "size": 1.18, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_heroku_ec2c8556f9", "resource_type": "image"}}}', 'heroku_ec2c8556f9', '.webp', 'image/webp', 3.26, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696776480/heroku_ec2c8556f9.webp', NULL, 'cloudinary', '{"public_id": "heroku_ec2c8556f9", "resource_type": "image"}', '/7', '2023-10-08 14:48:00.801', '2023-10-08 14:48:00.801', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (138, 'gcp.webp', NULL, NULL, 512, 512, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696776480/small_gcp_63f41422c6.webp", "hash": "small_gcp_63f41422c6", "mime": "image/webp", "name": "small_gcp.webp", "path": null, "size": 12.12, "width": 500, "height": 500, "provider_metadata": {"public_id": "small_gcp_63f41422c6", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696776480/thumbnail_gcp_63f41422c6.webp", "hash": "thumbnail_gcp_63f41422c6", "mime": "image/webp", "name": "thumbnail_gcp.webp", "path": null, "size": 3.42, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_gcp_63f41422c6", "resource_type": "image"}}}', 'gcp_63f41422c6', '.webp', 'image/webp', 10.27, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696776480/gcp_63f41422c6.webp', NULL, 'cloudinary', '{"public_id": "gcp_63f41422c6", "resource_type": "image"}', '/7', '2023-10-08 14:48:01.026', '2023-10-08 14:48:01.026', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (139, 'azure.svg', NULL, NULL, 128, 128, NULL, 'azure_d402baa986', '.svg', 'image/svg+xml', 1.71, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696776480/azure_d402baa986.svg', NULL, 'cloudinary', '{"public_id": "azure_d402baa986", "resource_type": "image"}', '/7', '2023-10-08 14:48:01.663', '2023-10-08 14:48:01.663', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (140, 'aws.svg', NULL, NULL, 128, 128, NULL, 'aws_78106f8b01', '.svg', 'image/svg+xml', 1.00, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696776480/aws_78106f8b01.svg', NULL, 'cloudinary', '{"public_id": "aws_78106f8b01", "resource_type": "image"}', '/7', '2023-10-08 14:48:01.714', '2023-10-08 14:48:01.714', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (141, 'jenkins.svg', NULL, NULL, 128, 128, NULL, 'jenkins_f1ec36a7da', '.svg', 'image/svg+xml', 25.66, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696776480/jenkins_f1ec36a7da.svg', NULL, 'cloudinary', '{"public_id": "jenkins_f1ec36a7da", "resource_type": "image"}', '/7', '2023-10-08 14:48:01.745', '2023-10-08 14:48:01.745', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (142, 'docker.svg', NULL, NULL, 2500, 2100, NULL, 'docker_437fff5fd0', '.svg', 'image/svg+xml', 9.57, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696776480/docker_437fff5fd0.svg', NULL, 'cloudinary', '{"public_id": "docker_437fff5fd0", "resource_type": "image"}', '/7', '2023-10-08 14:48:02.138', '2023-10-08 14:48:02.138', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (143, 'asp-net.webp', NULL, NULL, 653, 401, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696776666/small_asp_net_3ce326efef.webp", "hash": "small_asp_net_3ce326efef", "mime": "image/webp", "name": "small_asp-net.webp", "path": null, "size": 28.37, "width": 500, "height": 307, "provider_metadata": {"public_id": "small_asp_net_3ce326efef", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696776666/thumbnail_asp_net_3ce326efef.webp", "hash": "thumbnail_asp_net_3ce326efef", "mime": "image/webp", "name": "thumbnail_asp-net.webp", "path": null, "size": 11.34, "width": 245, "height": 150, "provider_metadata": {"public_id": "thumbnail_asp_net_3ce326efef", "resource_type": "image"}}}', 'asp_net_3ce326efef', '.webp', 'image/webp', 34.88, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696776666/asp_net_3ce326efef.webp', NULL, 'cloudinary', '{"public_id": "asp_net_3ce326efef", "resource_type": "image"}', '/7', '2023-10-08 14:51:06.793', '2023-10-08 14:51:06.793', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (144, 'cs.svg', NULL, NULL, 128, 128, NULL, 'cs_c242ead45c', '.svg', 'image/svg+xml', 0.86, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696776665/cs_c242ead45c.svg', NULL, 'cloudinary', '{"public_id": "cs_c242ead45c", "resource_type": "image"}', '/7', '2023-10-08 14:51:06.929', '2023-10-08 14:51:06.929', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (145, 'aspnet.png', NULL, NULL, 500, 500, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696776896/thumbnail_aspnet_0eca47f91d.png", "hash": "thumbnail_aspnet_0eca47f91d", "mime": "image/png", "name": "thumbnail_aspnet.png", "path": null, "size": 18.25, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_aspnet_0eca47f91d", "resource_type": "image"}}}', 'aspnet_0eca47f91d', '.png', 'image/png', 25.46, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696776896/aspnet_0eca47f91d.png', NULL, 'cloudinary', '{"public_id": "aspnet_0eca47f91d", "resource_type": "image"}', '/7', '2023-10-08 14:54:57.081', '2023-10-08 14:54:57.081', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (146, 'rest-api.png', NULL, NULL, 500, 500, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696777847/thumbnail_rest_api_bcb56439ca.png", "hash": "thumbnail_rest_api_bcb56439ca", "mime": "image/png", "name": "thumbnail_rest-api.png", "path": null, "size": 9.96, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_rest_api_bcb56439ca", "resource_type": "image"}}}', 'rest_api_bcb56439ca', '.png', 'image/png', 7.94, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696777847/rest_api_bcb56439ca.png', NULL, 'cloudinary', '{"public_id": "rest_api_bcb56439ca", "resource_type": "image"}', '/7', '2023-10-08 15:10:48.076', '2023-10-08 15:10:48.076', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (147, 'graphql.png', NULL, NULL, 500, 500, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696777847/thumbnail_graphql_8f8abe1d53.png", "hash": "thumbnail_graphql_8f8abe1d53", "mime": "image/png", "name": "thumbnail_graphql.png", "path": null, "size": 8.56, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_graphql_8f8abe1d53", "resource_type": "image"}}}', 'graphql_8f8abe1d53', '.png', 'image/png', 5.70, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696777847/graphql_8f8abe1d53.png', NULL, 'cloudinary', '{"public_id": "graphql_8f8abe1d53", "resource_type": "image"}', '/7', '2023-10-08 15:10:48.102', '2023-10-08 15:10:48.102', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (148, 'mysql.svg', NULL, NULL, 128, 128, NULL, 'mysql_8d19374953', '.svg', 'image/svg+xml', 2.81, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696778215/mysql_8d19374953.svg', NULL, 'cloudinary', '{"public_id": "mysql_8d19374953", "resource_type": "image"}', '/7', '2023-10-08 15:16:57.035', '2023-10-08 15:16:57.035', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (152, 'cucumber.png', NULL, NULL, 261, 300, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696778292/thumbnail_cucumber_22ba5240a8.png", "hash": "thumbnail_cucumber_22ba5240a8", "mime": "image/png", "name": "thumbnail_cucumber.png", "path": null, "size": 9.45, "width": 136, "height": 156, "provider_metadata": {"public_id": "thumbnail_cucumber_22ba5240a8", "resource_type": "image"}}}', 'cucumber_22ba5240a8', '.png', 'image/png', 4.00, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696778292/cucumber_22ba5240a8.png', NULL, 'cloudinary', '{"public_id": "cucumber_22ba5240a8", "resource_type": "image"}', '/7', '2023-10-08 15:18:13.335', '2023-10-08 15:18:13.335', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (153, 'peri.png', NULL, NULL, 500, 500, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1696781679/thumbnail_peri_496d797ab9.png", "hash": "thumbnail_peri_496d797ab9", "mime": "image/png", "name": "thumbnail_peri.png", "path": null, "size": 26.66, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_peri_496d797ab9", "resource_type": "image"}}}', 'peri_496d797ab9', '.png', 'image/png', 59.65, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1696781679/peri_496d797ab9.png', NULL, 'cloudinary', '{"public_id": "peri_496d797ab9", "resource_type": "image"}', '/9', '2023-10-08 16:14:39.706', '2023-10-08 16:14:39.706', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (154, 'ict-group.webp', NULL, NULL, 136, 137, NULL, 'ict_group_b0c9e32b50', '.webp', 'image/webp', 1.44, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697885952/ict_group_b0c9e32b50.webp', NULL, 'cloudinary', '{"public_id": "ict_group_b0c9e32b50", "resource_type": "image"}', '/9', '2023-10-21 10:59:12.484', '2023-10-21 10:59:12.484', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (155, 'ict-group.png', NULL, NULL, 500, 500, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697886318/thumbnail_ict_group_1249c4776b.png", "hash": "thumbnail_ict_group_1249c4776b", "mime": "image/png", "name": "thumbnail_ict-group.png", "path": null, "size": 10.52, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_ict_group_1249c4776b", "resource_type": "image"}}}', 'ict_group_1249c4776b', '.png', 'image/png', 11.61, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697886318/ict_group_1249c4776b.png', NULL, 'cloudinary', '{"public_id": "ict_group_1249c4776b", "resource_type": "image"}', '/9', '2023-10-21 11:05:19.099', '2023-10-21 11:05:19.099', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (156, 'next.png', NULL, NULL, 500, 500, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697886621/thumbnail_next_f836ee03ad.png", "hash": "thumbnail_next_f836ee03ad", "mime": "image/png", "name": "thumbnail_next.png", "path": null, "size": 7.97, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_next_f836ee03ad", "resource_type": "image"}}}', 'next_f836ee03ad', '.png', 'image/png', 9.58, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697886621/next_f836ee03ad.png', NULL, 'cloudinary', '{"public_id": "next_f836ee03ad", "resource_type": "image"}', '/', '2023-10-21 11:10:22.042', '2023-10-21 11:10:22.042', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (157, 'flask.png', NULL, NULL, 500, 500, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697886721/thumbnail_flask_c1765ddd56.png", "hash": "thumbnail_flask_c1765ddd56", "mime": "image/png", "name": "thumbnail_flask.png", "path": null, "size": 11.82, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_flask_c1765ddd56", "resource_type": "image"}}}', 'flask_c1765ddd56', '.png', 'image/png', 21.25, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697886721/flask_c1765ddd56.png', NULL, 'cloudinary', '{"public_id": "flask_c1765ddd56", "resource_type": "image"}', '/', '2023-10-21 11:12:01.924', '2023-10-21 11:12:01.924', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (158, 'express.png', NULL, NULL, 500, 500, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697886805/thumbnail_express_5cec6dbf4c.png", "hash": "thumbnail_express_5cec6dbf4c", "mime": "image/png", "name": "thumbnail_express.png", "path": null, "size": 6.07, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_express_5cec6dbf4c", "resource_type": "image"}}}', 'express_5cec6dbf4c', '.png', 'image/png', 7.16, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697886805/express_5cec6dbf4c.png', NULL, 'cloudinary', '{"public_id": "express_5cec6dbf4c", "resource_type": "image"}', '/', '2023-10-21 11:13:25.913', '2023-10-21 11:13:25.913', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (160, 'gess.png', NULL, NULL, 1304, 713, '{"large": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697889751/large_gess_349457ba7e.png", "hash": "large_gess_349457ba7e", "mime": "image/png", "name": "large_gess.png", "path": null, "size": 1168.64, "width": 1000, "height": 547, "provider_metadata": {"public_id": "large_gess_349457ba7e", "resource_type": "image"}}, "small": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697889750/small_gess_349457ba7e.png", "hash": "small_gess_349457ba7e", "mime": "image/png", "name": "small_gess.png", "path": null, "size": 282.37, "width": 500, "height": 273, "provider_metadata": {"public_id": "small_gess_349457ba7e", "resource_type": "image"}}, "medium": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697889751/medium_gess_349457ba7e.png", "hash": "medium_gess_349457ba7e", "mime": "image/png", "name": "medium_gess.png", "path": null, "size": 645.68, "width": 750, "height": 410, "provider_metadata": {"public_id": "medium_gess_349457ba7e", "resource_type": "image"}}, "thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697889750/thumbnail_gess_349457ba7e.png", "hash": "thumbnail_gess_349457ba7e", "mime": "image/png", "name": "thumbnail_gess.png", "path": null, "size": 70.37, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_gess_349457ba7e", "resource_type": "image"}}}', 'gess_349457ba7e', '.png', 'image/png', 479.15, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697889750/gess_349457ba7e.png', NULL, 'cloudinary', '{"public_id": "gess_349457ba7e", "resource_type": "image"}', '/6', '2023-10-21 12:02:31.843', '2023-10-21 12:02:31.843', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (162, 'twitch.webp', NULL, NULL, 1508, 848, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697893130/large_twitch_c194f01260.webp", "hash": "large_twitch_c194f01260", "mime": "image/webp", "name": "large_twitch.webp", "path": null, "size": 44.6, "width": 1000, "height": 562, "provider_metadata": {"public_id": "large_twitch_c194f01260", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697893130/small_twitch_c194f01260.webp", "hash": "small_twitch_c194f01260", "mime": "image/webp", "name": "small_twitch.webp", "path": null, "size": 17.95, "width": 500, "height": 281, "provider_metadata": {"public_id": "small_twitch_c194f01260", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697893130/medium_twitch_c194f01260.webp", "hash": "medium_twitch_c194f01260", "mime": "image/webp", "name": "medium_twitch.webp", "path": null, "size": 31.28, "width": 750, "height": 422, "provider_metadata": {"public_id": "medium_twitch_c194f01260", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697893130/thumbnail_twitch_c194f01260.webp", "hash": "thumbnail_twitch_c194f01260", "mime": "image/webp", "name": "thumbnail_twitch.webp", "path": null, "size": 5.84, "width": 245, "height": 138, "provider_metadata": {"public_id": "thumbnail_twitch_c194f01260", "resource_type": "image"}}}', 'twitch_c194f01260', '.webp', 'image/webp', 73.23, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697893130/twitch_c194f01260.webp', NULL, 'cloudinary', '{"public_id": "twitch_c194f01260", "resource_type": "image"}', '/6', '2023-10-21 12:58:52.378', '2023-10-21 12:58:52.378', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (163, 'zebra.webp', NULL, NULL, 821, 448, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697904499/small_zebra_ae2b53c7f9.webp", "hash": "small_zebra_ae2b53c7f9", "mime": "image/webp", "name": "small_zebra.webp", "path": null, "size": 25.07, "width": 500, "height": 273, "provider_metadata": {"public_id": "small_zebra_ae2b53c7f9", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697904499/medium_zebra_ae2b53c7f9.webp", "hash": "medium_zebra_ae2b53c7f9", "mime": "image/webp", "name": "medium_zebra.webp", "path": null, "size": 40.22, "width": 750, "height": 409, "provider_metadata": {"public_id": "medium_zebra_ae2b53c7f9", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697904499/thumbnail_zebra_ae2b53c7f9.webp", "hash": "thumbnail_zebra_ae2b53c7f9", "mime": "image/webp", "name": "thumbnail_zebra.webp", "path": null, "size": 9.92, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_zebra_ae2b53c7f9", "resource_type": "image"}}}', 'zebra_ae2b53c7f9', '.webp', 'image/webp', 48.62, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697904499/zebra_ae2b53c7f9.webp', NULL, 'cloudinary', '{"public_id": "zebra_ae2b53c7f9", "resource_type": "image"}', '/6', '2023-10-21 16:08:19.817', '2023-10-21 16:08:19.817', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (164, 'pigeons.webp', NULL, NULL, 2705, 1478, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697905495/large_pigeons_73a6d7be86.webp", "hash": "large_pigeons_73a6d7be86", "mime": "image/webp", "name": "large_pigeons.webp", "path": null, "size": 24.85, "width": 1000, "height": 546, "provider_metadata": {"public_id": "large_pigeons_73a6d7be86", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697905495/small_pigeons_73a6d7be86.webp", "hash": "small_pigeons_73a6d7be86", "mime": "image/webp", "name": "small_pigeons.webp", "path": null, "size": 10.73, "width": 500, "height": 273, "provider_metadata": {"public_id": "small_pigeons_73a6d7be86", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697905495/medium_pigeons_73a6d7be86.webp", "hash": "medium_pigeons_73a6d7be86", "mime": "image/webp", "name": "medium_pigeons.webp", "path": null, "size": 17.84, "width": 750, "height": 410, "provider_metadata": {"public_id": "medium_pigeons_73a6d7be86", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697905495/thumbnail_pigeons_73a6d7be86.webp", "hash": "thumbnail_pigeons_73a6d7be86", "mime": "image/webp", "name": "thumbnail_pigeons.webp", "path": null, "size": 3.68, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_pigeons_73a6d7be86", "resource_type": "image"}}}', 'pigeons_73a6d7be86', '.webp', 'image/webp', 79.75, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697905495/pigeons_73a6d7be86.webp', NULL, 'cloudinary', '{"public_id": "pigeons_73a6d7be86", "resource_type": "image"}', '/6', '2023-10-21 16:24:55.542', '2023-10-21 16:24:55.542', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (165, 'Wc.webp', NULL, NULL, 563, 308, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697905931/small_Wc_f25a2742ab.webp", "hash": "small_Wc_f25a2742ab", "mime": "image/webp", "name": "small_Wc.webp", "path": null, "size": 9.38, "width": 500, "height": 274, "provider_metadata": {"public_id": "small_Wc_f25a2742ab", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697905931/thumbnail_Wc_f25a2742ab.webp", "hash": "thumbnail_Wc_f25a2742ab", "mime": "image/webp", "name": "thumbnail_Wc.webp", "path": null, "size": 3.21, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_Wc_f25a2742ab", "resource_type": "image"}}}', 'Wc_f25a2742ab', '.webp', 'image/webp', 12.80, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697905931/Wc_f25a2742ab.webp', NULL, 'cloudinary', '{"public_id": "Wc_f25a2742ab", "resource_type": "image"}', '/6', '2023-10-21 16:32:12.197', '2023-10-21 16:32:12.197', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (166, 'msc.webp', NULL, NULL, 1182, 646, '{"large": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697906420/large_msc_9a8f1a06fa.webp", "hash": "large_msc_9a8f1a06fa", "mime": "image/webp", "name": "large_msc.webp", "path": null, "size": 63.84, "width": 1000, "height": 547, "provider_metadata": {"public_id": "large_msc_9a8f1a06fa", "resource_type": "image"}}, "small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697906420/small_msc_9a8f1a06fa.webp", "hash": "small_msc_9a8f1a06fa", "mime": "image/webp", "name": "small_msc.webp", "path": null, "size": 17.79, "width": 500, "height": 273, "provider_metadata": {"public_id": "small_msc_9a8f1a06fa", "resource_type": "image"}}, "medium": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697906420/medium_msc_9a8f1a06fa.webp", "hash": "medium_msc_9a8f1a06fa", "mime": "image/webp", "name": "medium_msc.webp", "path": null, "size": 38.56, "width": 750, "height": 410, "provider_metadata": {"public_id": "medium_msc_9a8f1a06fa", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697906420/thumbnail_msc_9a8f1a06fa.webp", "hash": "thumbnail_msc_9a8f1a06fa", "mime": "image/webp", "name": "thumbnail_msc.webp", "path": null, "size": 4.53, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_msc_9a8f1a06fa", "resource_type": "image"}}}', 'msc_9a8f1a06fa', '.webp', 'image/webp', 105.90, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697906420/msc_9a8f1a06fa.webp', NULL, 'cloudinary', '{"public_id": "msc_9a8f1a06fa", "resource_type": "image"}', '/6', '2023-10-21 16:40:21.415', '2023-10-21 16:40:21.415', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (167, 'satd.png', NULL, NULL, 494, 270, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697906807/thumbnail_satd_305bb57661.png", "hash": "thumbnail_satd_305bb57661", "mime": "image/png", "name": "thumbnail_satd.png", "path": null, "size": 37.2, "width": 245, "height": 134, "provider_metadata": {"public_id": "thumbnail_satd_305bb57661", "resource_type": "image"}}}', 'satd_305bb57661', '.png', 'image/png', 43.69, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697906807/satd_305bb57661.png', NULL, 'cloudinary', '{"public_id": "satd_305bb57661", "resource_type": "image"}', '/6', '2023-10-21 16:46:47.893', '2023-10-21 16:46:47.893', 1, 1);


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
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (64, 93, 2, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (65, 89, 6, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (66, 91, 6, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (67, 92, 6, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (68, 90, 6, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (69, 18, 7, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (70, 19, 7, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (71, 20, 7, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (75, 10, 9, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (76, 11, 9, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (77, 12, 9, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (78, 13, 9, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (79, 5, 10, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (80, 6, 10, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (81, 7, 10, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (82, 8, 10, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (83, 14, 10, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (84, 1, 9, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (86, 3, 9, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (87, 4, 9, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (88, 94, 9, 1);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (89, 95, 8, 1);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (90, 96, 8, 2);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (91, 97, 8, 3);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (92, 98, 8, 4);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (93, 84, 11, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (94, 85, 11, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (95, 88, 11, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (96, 99, 11, 1);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (97, 100, 4, 15);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (100, 101, 3, 13);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (101, 102, 2, 10);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (102, 103, 7, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (103, 104, 7, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (105, 106, 7, 1);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (106, 107, 7, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (107, 108, 7, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (109, 110, 7, 2);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (111, 112, 7, 4);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (113, 114, 7, 6);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (114, 115, 7, 7);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (115, 116, 7, 8);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (116, 117, 7, 9);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (117, 118, 7, 10);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (119, 120, 7, 11);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (120, 121, 7, 12);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (121, 122, 7, 13);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (122, 123, 7, 14);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (123, 124, 7, 15);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (124, 125, 7, 16);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (125, 126, 7, 17);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (126, 127, 7, 18);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (127, 128, 7, 19);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (128, 129, 7, 20);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (129, 130, 7, 21);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (130, 131, 7, 22);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (131, 132, 7, 23);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (132, 133, 7, 24);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (133, 137, 7, 25);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (134, 138, 7, 26);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (135, 139, 7, 27);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (136, 140, 7, 28);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (137, 141, 7, 29);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (138, 142, 7, 30);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (139, 143, 7, 31);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (140, 144, 7, 32);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (141, 145, 7, 33);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (142, 146, 7, 34);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (143, 147, 7, 35);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (144, 148, 7, 36);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (145, 149, 7, 37);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (146, 150, 7, 38);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (147, 151, 7, 39);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (148, 152, 7, 40);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (149, 153, 9, 2);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (150, 154, 9, 3);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (151, 155, 9, 4);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (153, 160, 6, 1);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (155, 162, 6, 3);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (156, 163, 6, 4);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (157, 164, 6, 5);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (158, 165, 6, 6);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (159, 166, 6, 7);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (160, 167, 6, 8);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (161, 168, 8, 5);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (163, 169, 6, 9);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (164, 170, 6, 10);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (165, 171, 6, 11);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (166, 172, 6, 12);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (167, 173, 6, 13);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (168, 174, 6, 14);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (169, 175, 6, 15);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (170, 176, 9, 5);


--
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (150, 6, 2, 'api::school.school', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (151, 11, 2, 'api::school.school', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (7, 1, 2, 'api::job.job', 'Icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (8, 1, 3, 'api::job.job', 'Icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (431, 124, 7, 'api::skill.skill', 'icons', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (432, 123, 7, 'api::skill.skill', 'icons', 2);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (158, 7, 1, 'api::school.school', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (159, 10, 1, 'api::school.school', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (160, 7, 5, 'api::school.school', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (161, 10, 5, 'api::school.school', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (21, 7, 1, 'api::language.language', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (22, 8, 2, 'api::language.language', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (23, 5, 3, 'api::language.language', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (24, 6, 4, 'api::language.language', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (166, 101, 12, 'api::tv-show.tv-show', 'poster', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (167, 102, 11, 'api::podcast.podcast', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (446, 114, 6, 'api::skill.skill', 'icons', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (280, 129, 8, 'api::skill.skill', 'icons', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (281, 130, 8, 'api::skill.skill', 'icons', 2);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (282, 127, 8, 'api::skill.skill', 'icons', 3);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (283, 126, 8, 'api::skill.skill', 'icons', 4);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (447, 115, 6, 'api::skill.skill', 'icons', 2);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (448, 116, 6, 'api::skill.skill', 'icons', 3);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (449, 156, 6, 'api::skill.skill', 'icons', 4);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (450, 118, 6, 'api::skill.skill', 'icons', 5);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (459, 121, 5, 'api::skill.skill', 'icons', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (460, 135, 5, 'api::skill.skill', 'icons', 2);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (461, 120, 5, 'api::skill.skill', 'icons', 3);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (462, 158, 5, 'api::skill.skill', 'icons', 4);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (466, 91, 9, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (50, 33, 1, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (51, 41, 2, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (52, 36, 3, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (53, 26, 4, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (54, 32, 5, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (55, 22, 6, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (56, 35, 7, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (57, 23, 8, 'api::book.book', 'cover', 1);
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
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (479, 163, 13, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (482, 164, 14, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (484, 166, 16, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (105, 89, 3, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (491, 168, 4, 'api::publication.publication', 'file', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (492, 168, 5, 'api::publication.publication', 'file', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (502, 91, 5, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (504, 174, 11, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (115, 92, 4, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (508, 165, 15, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (514, 175, 23, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (123, 90, 7, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (125, 90, 2, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (127, 93, 10, 'api::podcast.podcast', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (520, 14, 3, 'api::school.school', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (129, 27, 9, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (521, 12, 3, 'api::school.school', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (524, 6, 7, 'api::school.school', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (525, 176, 7, 'api::school.school', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (133, 21, 1, 'api::software-development-intro.software-development-intro', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (134, 100, 17, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (138, 1, 2, 'api::job.job', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (139, 1, 3, 'api::job.job', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (140, 94, 4, 'api::job.job', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (141, 3, 5, 'api::job.job', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (433, 148, 13, 'api::skill.skill', 'icons', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (434, 149, 13, 'api::skill.skill', 'icons', 2);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (435, 151, 13, 'api::skill.skill', 'icons', 3);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (436, 150, 13, 'api::skill.skill', 'icons', 4);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (439, 4, 6, 'api::job.job', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (445, 155, 7, 'api::job.job', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (451, 18, 1, 'api::skill.skill', 'icons', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (452, 108, 1, 'api::skill.skill', 'icons', 2);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (453, 107, 1, 'api::skill.skill', 'icons', 3);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (454, 157, 1, 'api::skill.skill', 'icons', 4);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (455, 18, 3, 'api::skill.skill', 'icons', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (456, 108, 3, 'api::skill.skill', 'icons', 2);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (457, 107, 3, 'api::skill.skill', 'icons', 3);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (458, 157, 3, 'api::skill.skill', 'icons', 4);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (284, 128, 8, 'api::skill.skill', 'icons', 5);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (285, 131, 8, 'api::skill.skill', 'icons', 6);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (286, 125, 8, 'api::skill.skill', 'icons', 7);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (287, 132, 9, 'api::skill.skill', 'icons', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (288, 133, 9, 'api::skill.skill', 'icons', 2);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (477, 162, 12, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (486, 167, 17, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (493, 169, 18, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (499, 172, 21, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (501, 173, 22, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (503, 170, 19, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (509, 171, 20, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (513, 89, 1, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (515, 160, 8, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (522, 6, 4, 'api::school.school', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (523, 153, 4, 'api::school.school', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (526, 170, 24, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (330, 144, 11, 'api::skill.skill', 'icons', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (331, 145, 11, 'api::skill.skill', 'icons', 2);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (413, 136, 2, 'api::skill.skill', 'icons', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (414, 104, 2, 'api::skill.skill', 'icons', 2);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (415, 20, 2, 'api::skill.skill', 'icons', 3);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (416, 152, 2, 'api::skill.skill', 'icons', 4);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (417, 103, 2, 'api::skill.skill', 'icons', 5);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (418, 106, 2, 'api::skill.skill', 'icons', 6);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (343, 146, 12, 'api::skill.skill', 'icons', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (344, 147, 12, 'api::skill.skill', 'icons', 2);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (419, 136, 4, 'api::skill.skill', 'icons', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (420, 104, 4, 'api::skill.skill', 'icons', 2);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (421, 20, 4, 'api::skill.skill', 'icons', 3);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (422, 152, 4, 'api::skill.skill', 'icons', 4);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (423, 103, 4, 'api::skill.skill', 'icons', 5);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (424, 106, 4, 'api::skill.skill', 'icons', 6);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (425, 140, 10, 'api::skill.skill', 'icons', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (426, 138, 10, 'api::skill.skill', 'icons', 2);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (427, 139, 10, 'api::skill.skill', 'icons', 3);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (428, 141, 10, 'api::skill.skill', 'icons', 4);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (429, 137, 10, 'api::skill.skill', 'icons', 5);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (430, 142, 10, 'api::skill.skill', 'icons', 6);


--
-- Data for Name: home_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.home_pages (id, greeting, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, introduction_1, introduction_2, introduction_3, introduction_4, introduction_5) VALUES (5, 'Hey there, I''m Marta ', '2023-10-27 14:59:03.641', '2023-10-27 15:02:27.684', '2023-10-27 15:02:27.659', 1, 1, 'en', 'I''m a software engineer based in Turin, Italy, and I am currently working at {Resourcify}.', 'I hold a MSc in Advanced Computer Science from the University of Manchester, and have spent the last 6 years working for several companies, including {Booking} and {BJSS}. ', 'My skill set spans a range of programming languages like **Java**, **Kotlin**, **Python**, **C#** and **TypeScript**, as well as frontend frameworks such as **React** and **Angular**.
', 'While I have a solid foundation in backend development, my heart truly lies in the realm of full-stack engineering.
', 'In my free time, I’m a fiction writer ✍🏻, an avid bookworm 📚, an oboist and alto singer 🎶, and a travel photographer 📷.');


--
-- Data for Name: home_pages_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



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

INSERT INTO public.jobs (id, description, title, company_name, location, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, start_date, end_date, is_current_job, main_color, dark_color, technologies) VALUES (4, 'A technology consultancy company that provides work opportunities on standalone projects, using a variety of programming languages and stacks.
- I mainly focused on the maintenance of a client''s eCommerce webapp using Drupal, where I implemented small changes across the entire user journey, from product search to purchase and payment.
- I also took on the responsibility of implementing the new cookie banner on the
client''s EU sites, which involved working on 9 domains, understanding business requirements and translating them into technical solutions, and coordinating with the QA team to verify the banner''s behaviour and ensuring a smooth release process.
- I supported the Platform team as a developer and tester in creating a
containerized version of the application.
- I was responsible for onboarding new software and QA engineers to the team’s tech stack; I also participated in a few dozens interviews involving technical/motivational questions and whiteboard programming to evaluate candidates.', 'Software Engineer', 'BJSS', 'Manchester (remote)', '2023-08-21 19:19:11.572', '2023-10-04 15:13:17.084', '2023-09-14 14:14:09.242', 1, 1, 'en', '2020-11-02', '2022-03-01', false, '#1447BA', '#CEDCFA', '["PHP", "Drupal", "Java", "JavaScript", "Angular", "Vue", "Google Tag Manager", "Docker", "Jenkins", "Azure"]');
INSERT INTO public.jobs (id, description, title, company_name, location, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, start_date, end_date, is_current_job, main_color, dark_color, technologies) VALUES (5, 'I joined the Graduate scheme, involving a team rotation every 6 months – a unique opportunity to gain expertise across the various services within the company.

Some backend projects involved:

- the migration of the legacy Pricing Engine to a modern Spring API as part of restructuring towards microservices architecture.
- the improvement of the platform that communicates with supplier APIs and manages the automated reservation process.

In the frontend area, 

- I maintained the Payment page of Rentalcars.com and Sanction Screening tool, in compliance with industry standards.
- I contributed to the development and scaling of the new "Premium" insurance product, driving revenue growth starting from a few small airports, then expanding the market presence to several popular holiday destinations.
- and contributed to web-replatforming efforts, developing various filters for the Rentalcars results page and creating "Premium" and "Full Insurance" upsell banners using React, integrating them into the main webapp.

I also conducted interviews for the company''s graduate scheme, identifying top talent to join the team, and helped implementing WFH techniques during Covid-19, enhancing productivity, communication and overall well-being.
', 'Graduate Software Engineer', 'Booking.com', 'Manchester', '2023-08-21 19:21:48.461', '2023-10-04 15:20:17.283', '2023-08-21 19:21:50.659', 1, 1, 'en', '2018-09-03', '2020-11-30', false, '#043580', '#b6d2fd', '["Java", "SpringBoot", "JavaScript", "React", "NodeJS", "PHP", "MySQL", "Docker", "Kubernetes", "AWS", "GCP"]');
INSERT INTO public.jobs (id, description, title, company_name, location, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, start_date, end_date, is_current_job, main_color, dark_color, technologies) VALUES (2, 'Full-stack work involving development of greenfield tools and maintenance of legacy components, covering a diverse range of projects and technologies, adapting to new challenges and delivering quality results.
- Started in the Recycler API/Platform Core team, where I honed my skills in building robust and scalable applications.
- Joined the Accounting Squad, taking a leading role in developing an accounting platform for internal and client use. I approached this project with a focus on user experience, performance, and maintainability, resulting in a successful product launch. In close collaboration with the Accounting Ops, I sought feedback to continuously improve the functionality of the platform, ensuring it met their specific needs.
- Scaled the application to serve a growing number of clients and their orders and invoices, and I ensured that the app could handle larger volumes of data with minimal latency, resulting in faster processing and improved overall system performance.', 'Full-Stack Engineer', 'Resourcify', 'Hamburg (remote)', '2023-08-14 16:51:46.424', '2023-10-03 19:09:39.57', '2023-08-14 16:51:48.467', 1, 1, 'en', '2022-03-01', NULL, true, '#156970', '#ABEAEF', '["Java", "SpringBoot", "TypeScript", "Angular", "MySQL", "AWS", "Docker", "Kubernetes"]');
INSERT INTO public.jobs (id, description, title, company_name, location, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, start_date, end_date, is_current_job, main_color, dark_color, technologies) VALUES (3, NULL, 'Sviluppatrice Full-Stack', 'Resourcify', 'Amburgo (remoto)', '2023-08-15 18:16:34.39', '2023-10-03 19:09:39.621', '2023-08-15 18:18:02.537', 1, 1, 'it', '2022-03-01', NULL, true, '#156970', '#ABEAEF', '["Java", "SpringBoot", "TypeScript", "Angular", "MySQL", "AWS", "Docker", "Kubernetes"]');
INSERT INTO public.jobs (id, description, title, company_name, location, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, start_date, end_date, is_current_job, main_color, dark_color, technologies) VALUES (6, 'Academic research about contracts and policies of cloud services, following the changes introduced by the new European law on data protection (GDPR). The article, published on IEEE Cloud Computing, was written in collaboration with law and computer science professors from the Free University of Bolzano and University of Insubria.', 'Research Assistant, project-based Contract', 'UniBZ – Faculty of Computer Science', NULL, '2023-08-21 19:26:39.8', '2023-10-21 10:48:32.722', '2023-08-21 19:26:41.722', 1, 1, 'en', '2017-10-01', '2018-03-31', false, '#147AE3', '#b8d8f9', '["Cloud Computing", "GDPR", "SaaS", "Technical Writing"]');
INSERT INTO public.jobs (id, description, title, company_name, location, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, start_date, end_date, is_current_job, main_color, dark_color, technologies) VALUES (7, 'Summer internship granting university credits, followed by a 5-month remote collaboration contract.

I was responsible for implementing a customized Human Resource Management System (HRMS) according to a client''s specific requirements, resulting in an adaptable web portal for efficient management of employee holidays, permits, and sick days.', 'Software Developer, Internship + Contract', 'ICT Group', 'Reggio Emilia', '2023-10-21 10:59:16.943', '2023-10-21 11:06:47.26', '2023-10-21 10:59:28.197', 1, 1, 'en', '2016-07-03', '2017-03-31', false, '#5CC1E1', '#96e7ff', '["AngularJS", "NodeJS", "HTML", "CSS", "JavaScript", "JQuery", "MongoDB"]');


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
INSERT INTO public.podcasts (id, name, author, language, media_link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (10, 'Dove Nessuno Guarda', 'Pablo Trincia', 'it', 'https://open.spotify.com/show/36ZECce3GCbgqrilE2kcaJ', '2023-09-12 19:26:38.83', '2023-09-12 19:26:41.05', '2023-09-12 19:26:41.045', 1, 1);
INSERT INTO public.podcasts (id, name, author, language, media_link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (11, 'Stories', 'Cecilia Sala', 'it', 'https://open.spotify.com/show/1FaCiqGahURjjO42JOMiyd', '2023-10-07 20:35:46.402', '2023-10-07 20:35:48.412', '2023-10-07 20:35:48.408', 1, 1);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (23, 'Personal website 2.0', 'My new personal website, implemented with Next.js', 'After a few years, I embarked on a journey to give my website a much-needed refresh, harnessing the latest technologies and the wealth of knowledge and skills I''d acquired over time.

The website is now implemented using React in combination with **Next.js**, making it lightning-fast and highly efficient. I''ve incorporated **Tailwind CSS** and Material-UI, which provide not only aesthetic appeal but also a seamless user experience. For the first time it also features a dark mode.

Under the hood, a **GraphQL** backend ensures data retrieval is optimized, while content creation and updates are handled through the **Strapi CMS**, offering flexibility and control over the website''s content.

For deployment and hosting, the website finds its home on **Vercel**.', 'nextjs,react,typescript,tailwind,graphql,strapi,vercel', '2023-07-01', 'personal,web,react', '{"github": "https://github.com/martapanc/martacodes.it", "publicUrl": "https://martacodes.it"}', '2023-10-21 18:34:43.266', '2023-10-22 08:30:00.951', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (5, 'Cloud computing and GDPR ', 'Research article on the effects of GDPR on Cloud services, published by IEEE in 2018', 'Disclosing personal data for a purpose not known by data subjects is a practice that the 2018 EU **General Data Protection Regulation** (GDPR) is supposed to prevent. This article gives an overview of the major aspects of GDPR related to provision, use, and maintenance of **cloud services and technologies**, with the objective of representing effective guidance for companies during the process of complying with the new laws.

The article was written in collaboration between professors and associates of the faculties of Law and Computer Science of the Free University of Bolzano, and was accepted by IEEE for publication in the Nov/Dec 2018 issue.', 'cloud', '2018-04-01', 'university,gdpr,cloud', '{"article": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692731283/IEEE_cb505789df.pdf", "publicUrl": "https://www.computer.org/csdl/magazine/cd/2018/06/mcd2018060058/17D45XwUAKp"}', '2023-09-10 10:40:32.028', '2023-10-21 17:55:12.234', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (24, 'Holiday request manager', 'Internship project: HMRS software with a versatile employee portal', 'I interned for three months at the [ICT Group](https://ict-group.it/en/) as a web developer, and my task was to build an additional feature to the company’s **HR management software**: a portal for the request and approval of the employee vacations, work permits, transfers and bank hours. 

The UI I developed consists of customisable calendars and timesheets, which offer different views according to the role of the logged user (employee or manager), and was built using **AngularJS** with the **Boostrap CSS** framework.', 'angular,nodejs,html,css,bootstrap,javascript', '2016-07-01', 'web,angular,work', '{"article": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697909072/Internship_Final_Report.pdf"}', '2023-10-27 17:29:54.415', '2023-10-27 17:30:01.91', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (2, 'Fiscal Code Android app', 'Android application for computing an Italian Fiscal Code via the public algorithm, and verifying a code''s validity', 'I started learning Android development recently and, in order to focus on the features of the mobile world, as well as on practising with Kotlin, I''ve been reusing the Java backend of the Fiscal Code calculator I built in university. 

The app has been downloaded 100000+ times and reached a rating of 4.3 during its lifetime. ', 'java,kotlin,android', '2020-06-01', 'java,kotlin,android,personal', '{"github": "https://github.com/martapanc/ItalianFiscalCodeCalculatorApp"}', '2023-09-10 10:22:46.831', '2023-09-10 21:39:16.263', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (1, 'All-Star Advent of Code', 'My submissions to all Advent of Code challenges (2015-2022)', 'I''ve been participating actively in the Advent of Code challenges since 2020, and after finishing the 2020 event, I decided to go back and solve all puzzles from the past years. 

I succeeded in a few weeks, and now I''m quite proud of my shiny 400 stars ⭐  — not to mention the huge progress I''ve made with Kotlin, complex algorithms and problem solving in general.

As a side project, I''ve also put together an API that automatically sets up a new class for the new daily challenge and downloads the input data, and automatically fetches the star progress from my account to update the Readme.', 'java,python,kotlin', '2022-12-31', 'personal,java,kotlin,python', '{"github": "https://github.com/martapanc/Advent-Of-Code", "github2": "https://github.com/martapanc/aoc-data-api"}', '2023-09-10 10:18:00.345', '2023-10-21 18:53:47.665', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (14, 'Pigeon Family Cam', 'RaspberryPi-powered webcam monitoring a pigeon nest on my balcony', 'When a couple of pigeons nests on your balcony, what could be better than installing a RasPi webcam and broadcasting their lives on the internet?', 'raspberrypi,react,typescript,firebase', '2021-01-08', 'react,type,raspberrypi,personal', '{"github": "https://github.com/martapanc/pigeon-family-cam"}', '2023-10-21 16:25:27.272', '2023-10-21 16:26:01.968', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (18, 'Team toolbar plugin', 'Customisable XBar plugin for streamlined team process monitoring', 'Many teams have a considerable number of processes and metrics to monitor and links to web resources, which often end up all over the place in the browser. To gather all of those I created a plugin for [XBar](https://xbarapp.com/), a useful app that lets you put the output from any script in the MacOS toolbar. 

Connecting to the company''s servers, the toolbar shows Bamboo build and deployment processes, pull requests, release statuses and such. Now my team uses the toolbar on a daily basis and I''m currently working on extending its functionality, e.g. to allow other teams to easily add their own configuration.', 'python,bash', '2020-03-01', 'python,work', '{"github": "https://github.com/martapanc/BitBar-distrib"}', '2023-10-21 17:17:10.373', '2023-10-21 17:17:15.924', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (12, 'Twitch-to-Slack notifier', 'Custom Python cron job to link Twitch to Slack for personalised live show notifications', 'I never want to miss a live show from my favourite Twitch streamers, and I''m used to grouping notifications on Slack channels as a way to organise them. 
After testing services like Zapier and IFTTT and getting quite dissatisfied with the licence limitations or the lack of customisation, I decided to write my own **cron job in Python**: it queries the **Twitch API** to find which of the streamers I follow goes live and then connects to a Slack webhook, displaying a nice-looking message.
Never gonna miss a show again!', 'python,slack,twitch', '2020-09-07', 'python,slack,twitch,personal', '{"github": "https://github.com/martapanc/Twitch-notifier"}', '2023-10-21 12:59:18.331', '2023-10-21 13:04:27.931', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (15, 'wc clone (Unix)', 'Clone of the Unix wc tool written in Python, using a black-box testing approach', 'First complex project in **Python** - creating a clone of the **Unix'' word count tool**, `wc`, based on re-engineering techniques and black-box testing and using only the Python Standard Library for the main functionality. 

The result is a program that produces the same output as the original wc for all known input sequences and file formats, including binary files.', 'python', '2017-11-01', 'python,uni', '{"github": "https://github.com/martapanc/comp61511"}', '2023-10-21 16:32:26.943', '2023-10-21 18:43:07.278', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (16, 'MSc Dissertation - Automated Grading', 'An automated grading tool for the programming assignment of the Software Engineering course', 'Creating a wc clone for my MSc Software Engineering course was enjoyable, although the grading process took longer than expected. 

This experience inspired my dissertation project, where I developed an automated testing tool for students'' coding exercises, aiming to streamline the instructor''s evaluation and grading tasks.', 'python', '2018-06-01', 'python,uni', '{"article": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692731486/comp61511_msc_dissertation.pdf"}', '2023-10-21 16:40:43.516', '2023-10-21 16:40:45.107', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (13, 'Power Usage Web Scraper', 'Automated power consumption monitoring from an energy supplier''s website, via Python web scraping.', 'What to do when your energy supplier offers a live balance of the energy usage in your account and you wish to monitor it to know how much you''re spending, but at the same time you don''t want to login every few hours? For me it was the perfect chance to learn web scraping with Python. 

The result is a script that logs in to my account, calls the supplier''s API at the desired time intervals and saves the results. 

A simple task, but a meaningful achievement and a fun way to apply coding skills to a real-life problem.', 'python', '2019-11-01', 'python,personal', '{"github": "https://github.com/martapanc/Zebra-Scraper"}', '2023-10-21 16:08:27.427', '2023-10-21 16:08:50.534', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (20, 'Werner''s Restaurant', 'Java webapp for restaurant reservation and take-away management', 'A full **Restaurant Manager webapp** in Java is the final project my team developed for the *Internet & Mobile Services* course: it allows customers to reserve a table or to book a takeaway order, and the restaurant managers to verify the status of the reservations and orders, add and remove takeaway meals and check other employees'' accounts, mostly in the form of CRUD tables.

I''ve recently made a v2 in Spring and deployed it on Heroku - [check it out](https://werners-restaurant.herokuapp.com/)!', 'java,spring,javascript,html,css,bootstrap', '2017-04-01', 'uni,java', '{"github": "https://github.com/martapanc/restaurantManager"}', '2023-10-21 17:41:33.539', '2023-10-21 18:44:29.564', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (21, 'Hack-my-Town', 'Innovative brand strategy for Glorenza-Glurns, the smallest town in South Tyrol
', 'A day of December 2014, four UniBZ computer science and design students were sent to the smallest town in South Tyrol, **Glorenza-Glurns**, with a challenge from their professors: find innovative ideas to **improve the life of a mountain village**, often isolated and closed in its daily life, which would offer history and attractions but fails to entice tourists to stay. 

Our solution, winner of the contest between UniBZ and other Italian universities, was to create a brand for Glorenza and a consortium for the towns in the area - a brand to promote the history, the beauty of the landscapes and the tastiness of the food and that tourists get to know and trust.', 'java,android', '2014-12-31', 'java,android,uni,hackathon', '{"publicUrl": "http://hackmytown.unibz.it/"}', '2023-10-21 17:45:42.44', '2023-10-21 17:47:24.826', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (8, 'Food Saver (GESS 2017)', 'Hackathon project created for the Global Entrepreneurship Summer School 2017 in Shanghai.', 'I was selected (among 1200+ applications) to attend the **Global Entrepreneurship Summer School** (GESS) 2017, hosted by the Tongji University in Shanghai, China. 

This year''s topic was “Food“, and our goal was to find solutions to related problems - such as food waste, obesity, hidden hunger and food safety. 

My team designed a mobile app that connects users to supermarkets and local food suppliers: most markets have an “expiring soon“ section with aliments that cannot be displayed being too close to their expiration date. This app would be a database listing such products, so that customers can save money and help reduce food waste, by purchasing groceries that are still perfectly safe to eat.
', 'java,android,apple', '2017-09-04', 'uni,hackathon,startup,entrepreneurship', '{"video": "https://www.youtube.com/watch?v=5gHGsLXIv8A", "video2": "https://www.facebook.com/globalsummerschool/videos/1394976080610286", "publicUrl": "https://oyaop.com/opportunity/conferences/global-entrepreneurship-summer-school-gess-2017"}', '2023-10-21 11:23:59.403', '2023-10-22 08:31:48.268', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (11, 'Premium Insurance UI components', 'Information banners for the new Premium insurance product at Rentalcars.com', 'As a part of the Graduate Scheme at Booking.com, I joined the team that develops the **"Premium" insurance product**, which offers exclusive benefits to the customer such as skipping the line at the car pickup counter, a lower deposit, no credit card required and a dedicated support helpline. 

We built the UI in React, developing various components (a comparison of the available insurance options for the car details page, a few upsell banners and information sections) that we then integrated in the main webapp.', 'java,react,typescript,css', '2019-01-05', 'java,react,typescript,work,web', '{"screenshots": "https://res.cloudinary.com/dwrurydlt/image/upload/v1697892427/premium-screenshots.pdf"}', '2023-10-21 12:49:02.547', '2023-10-21 17:59:56.418', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (4, 'mpancaldi.web.app', 'Initial iteration of my personal website using ReactJS', 'Built with ReactJS and later migrated to Typescript, it''s also a chance to play around with my web development skills and experiment with front-end technologies. ', 'react,javascript,typescript,firebase', '2019-01-01', 'web,personal,react,javascript,typescript,firebase', '{"github": "https://github.com/martapanc/react-gh-pages", "publicUrl": "https://mpancaldi.web.app/"}', '2023-09-10 10:30:28.313', '2023-09-10 15:51:20.443', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (22, 'Daily Programming', 'Daily coding challenges to improve programming skills', 'They say "Practice makes perfect", and that''s why a good programmer should write code every day.

The way I like to practise, when I don''t have more complex projects to work on, is to pick a coding challenge (e.g. from [r/dailyProgrammer](https://www.reddit.com/r/dailyprogrammer/), [CodeWars](https://www.codewars.com/dashboard/), [Project Euler](https://projecteuler.net/), [Advent of Code](https://adventofcode.com/), ...), or simply to think of a problem I want to tackle, and write my solution for it. This repository is a collection of all such challenges.', 'java,kotlin,python,javascript', '2020-01-01', 'java,kotlin,python,personal', '{"github": "https://github.com/martapanc/dailyProgramming"}', '2023-10-21 17:52:04.406', '2023-10-21 17:54:17.26', '2023-10-27 17:30:01.885', 1, 1, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (17, 'BSc Dissertation - Technical Debt', 'Heuristic algorithm for SATD method analysis and bug impact.', 'My BSc graduation project: I developed an heuristic algorithm that parses the so-called "SATD methods", that is Java methods that are affected by "Self-Admitted Technical Debt", instances of **Technical Debt** that the developers self-documented in the form of comments. 

The research then analysed how such methods evolve from the moment the comment was introduced through Version Control and, based on the bugs reported in the code''s issue tracker, how the presence of technical debt affects the amount of bugs on average.', 'java', '2017-06-01', 'java,uni', '{"github": "https://github.com/martapanc/SATD-replication-package", "article": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692731487/SATD_BSc_Thesis.pdf"}', '2023-10-21 16:46:53.368', '2023-10-21 16:47:24.524', '2023-10-27 17:30:01.885', 1, 1, 'en');


--
-- Data for Name: projects_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.publications (id, title, description, publisher, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, year, rank, file_url) VALUES (4, 'Automated assessment tools for COMP61511: Software Engineering Concepts in Practice', 'MSc Dissertation', 'University of Manchester', '2023-08-22 19:12:15.407', '2023-10-21 17:03:31.494', '2023-08-22 19:12:16.686', 1, 1, 'en', '2018', 1, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692731486/comp61511_msc_dissertation.pdf');
INSERT INTO public.publications (id, title, description, publisher, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, year, rank, file_url) VALUES (5, 'Automated assessment tools for COMP61511: Software Engineering Concepts in Practice', 'Tesi di laurea magistrale', 'University of Manchester', '2023-10-07 17:30:08.464', '2023-10-21 17:03:31.524', '2023-10-07 17:30:13.808', 1, 1, 'it', '2018', 1, NULL);
INSERT INTO public.publications (id, title, description, publisher, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, year, rank, file_url) VALUES (3, 'Studying the Change Impact of Self-Admitted Technical Debt', 'BSc Dissertation', 'University of Bozen-Bolzano', '2023-08-22 19:11:37.951', '2023-10-21 17:03:55.978', '2023-08-22 19:11:39.537', 1, 1, 'en', '2017', 2, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692731487/SATD_BSc_Thesis.pdf');
INSERT INTO public.publications (id, title, description, publisher, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, year, rank, file_url) VALUES (2, 'Cloud Computing and the New EU General Data Protection Regulation', 'Research project', 'IEEE Cloud Computing', '2023-08-22 18:03:03.727', '2023-10-21 17:06:26.019', '2023-08-22 18:03:05.239', 1, 1, 'en', '2018', 1, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1697907933/IEEE_article.pdf');


--
-- Data for Name: publications_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.publications_localizations_links (id, publication_id, inv_publication_id, publication_order) VALUES (1, 5, 4, 1);
INSERT INTO public.publications_localizations_links (id, publication_id, inv_publication_id, publication_order) VALUES (2, 4, 5, 1);


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
-- Data for Name: recruiters_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.recruiters_pages (id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, intro, outro) VALUES (6, '2023-10-27 16:58:23.59', '2023-10-27 16:58:27.826', '2023-10-27 16:58:27.786', 1, 1, 'en', 'Nice to meet you! I appreciate your interest in considering me for your software engineering positions. 

To streamline the process and provide clarity on my expectations, I''ve put together this page to share what I''m seeking in my next role. This way, we can make the most of our time together.', 'Thank you for reading this far! 

If you''re a recruiter looking to connect, please feel free to reach out through the [contact form](/contacts) or directly on [LinkedIn](https://www.linkedin.com/in/martapancaldi/), mentioning your role. I''d love to chat with you!');
INSERT INTO public.recruiters_pages (id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, intro, outro) VALUES (4, '2023-10-07 18:15:13.305', '2023-10-07 18:24:24.197', NULL, 1, 1, 'it', 'Piacere di conoscerti! Apprezzo il tuo interesse nel considerarmi per le vostre posizioni da ingegnere software. 

Per semplificare il processo e fornire chiarezza sulle mie aspettative, ho creato questa pagina per condividere ciò che cerco nel mio prossimo ruolo. In questo modo, potremo sfruttare al meglio il tempo a nostra disposizione.', 'Grazie per aver letto fino a qui! 

Se sei un reclutatore che desidera entrare in contatto con me, non esitare a contattarmi tramite il [modulo di contatto](/contatti), indicando il tuo ruolo. Mi piacerebbe chiacchierare con te!');
INSERT INTO public.recruiters_pages (id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, intro, outro) VALUES (3, '2023-09-18 19:45:05.15', '2023-10-21 09:14:48.929', NULL, 1, 1, 'en', 'Nice to meet you! I appreciate your interest in considering me for your software engineering positions. 

To streamline the process and provide clarity on my expectations, I''ve put together this page to share what I''m seeking in my next role. This way, we can make the most of our time together.', 'Thank you for reading this far! 

If you''re a recruiter looking to connect, please feel free to reach out through the [contact form](/contacts), mentioning your role. I''d love to chat with you!');
INSERT INTO public.recruiters_pages (id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, intro, outro) VALUES (5, '2023-10-27 15:06:32.28', '2023-10-27 15:06:34.685', NULL, 1, 1, 'en', 'Nice to meet you! I appreciate your interest in considering me for your software engineering positions. 

To streamline the process and provide clarity on my expectations, I''ve put together this page to share what I''m seeking in my next role. This way, we can make the most of our time together.', 'Thank you for reading this far! 

If you''re a recruiter looking to connect, please feel free to reach out through the [contact form](/contacts), mentioning your role. I''d love to chat with you!');


--
-- Data for Name: recruiters_pages_components; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (62, 3, 34, 'shared.titled-paragraph', 'tldr', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (64, 3, 35, 'shared.titled-paragraph', 'salary', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (67, 3, 36, 'shared.titled-paragraph', 'toolsTechs', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (68, 3, 37, 'shared.titled-paragraph', 'jobPreferences', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (104, 3, 38, 'shared.titled-paragraph', 'generalInfo', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (180, 4, 44, 'shared.titled-paragraph', 'tldr', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (183, 4, 45, 'shared.titled-paragraph', 'salary', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (184, 4, 46, 'shared.titled-paragraph', 'jobPreferences', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (187, 4, 47, 'shared.titled-paragraph', 'toolsTechs', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (188, 4, 48, 'shared.titled-paragraph', 'generalInfo', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (204, 5, 49, 'shared.titled-paragraph', 'jobPreferences', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (205, 5, 50, 'shared.titled-paragraph', 'tldr', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (206, 5, 51, 'shared.titled-paragraph', 'salary', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (207, 5, 52, 'shared.titled-paragraph', 'toolsTechs', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (208, 5, 53, 'shared.titled-paragraph', 'generalInfo', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (209, 6, 54, 'shared.titled-paragraph', 'jobPreferences', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (210, 6, 55, 'shared.titled-paragraph', 'tldr', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (211, 6, 56, 'shared.titled-paragraph', 'salary', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (212, 6, 57, 'shared.titled-paragraph', 'toolsTechs', NULL);
INSERT INTO public.recruiters_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (213, 6, 58, 'shared.titled-paragraph', 'generalInfo', NULL);


--
-- Data for Name: recruiters_pages_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.recruiters_pages_localizations_links (id, recruiters_page_id, inv_recruiters_page_id, recruiters_page_order) VALUES (3, 3, 4, NULL);
INSERT INTO public.recruiters_pages_localizations_links (id, recruiters_page_id, inv_recruiters_page_id, recruiters_page_order) VALUES (4, 5, 4, 1);
INSERT INTO public.recruiters_pages_localizations_links (id, recruiters_page_id, inv_recruiters_page_id, recruiters_page_order) VALUES (6, 6, 4, 1);
INSERT INTO public.recruiters_pages_localizations_links (id, recruiters_page_id, inv_recruiters_page_id, recruiters_page_order) VALUES (7, 4, 6, NULL);


--
-- Data for Name: schools; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.schools (id, school_name, degree_name, degree_url, grade, start, "end", description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (3, 'College of Charleston', 'Exchange Semester', 'http://compsci.cofc.edu/', '4.0 GPA', '2015-01-08', '2016-01-01', '- Partly subsidised by the "Erasmus+/Overseas" scholarship of the University of Bolzano.
- Main courses: Software Engineering, Computer Networks, Statistical Methods, Discrete Mathematics and Calculus III.
- I participated in the college orchestra as Principal Oboe.', '2023-08-22 17:07:41.915', '2023-10-27 17:21:27.251', '2023-08-22 17:07:43.654', 1, 1, 'en');
INSERT INTO public.schools (id, school_name, degree_name, degree_url, grade, start, "end", description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (1, 'University of Manchester', 'MSc in Advanced Computer Science', 'https://www.cs.manchester.ac.uk/', 'Distinction', '2017-09-01', '2018-09-01', '- Specialised in Software Engineering, with courses on Advanced programming, Agile and TDD, Design patterns and components.

- Elective courses in Data Engineering and IT Governance.

- The MSc dissertation project focused on building an automated assessment tool for testing and grading programming exercises.', '2023-08-22 17:01:28.107', '2023-10-07 17:21:08.021', '2023-08-22 17:01:30.447', 1, 1, 'en');
INSERT INTO public.schools (id, school_name, degree_name, degree_url, grade, start, "end", description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (5, 'University of Manchester', 'MSc in Informatica Avanzata', 'https://www.cs.manchester.ac.uk/', 'Distinction', '2017-09-01', '2018-09-01', '- Specializzazione in Ingegneria del software, con corsi di programmazione avanzata, Agile e TDD, Design pattern e componenti.

- Corsi elettivi in Data Engineering e IT Governance.

- Il progetto di tesi di laurea magistrale si è concentrato sullo sviluppo di uno strumento di valutazione automatizzato per testare e valutare gli esercizi di programmazione.', '2023-10-07 17:19:43.474', '2023-10-07 17:21:08.07', '2023-10-07 17:19:45.66', 1, 1, 'it');
INSERT INTO public.schools (id, school_name, degree_name, degree_url, grade, start, "end", description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (4, '"A. Peri" Music School', 'Diploma in Oboe', 'https://peri-merulo.it/', NULL, '2003-01-09', '2015-03-07', '- I followed the curriculum that prepares for the diploma in musical instrument (equivalent to a university degree), which includes among its various courses: choral and opera singing, music theory and solfeggio, harmony, history of music, orchestra and chamber music, study of the Oboe and English Horn.
- I took part in a Masterclass with Luca Vignali, oboist at Rome Opera House.
- I participated in several local events, with the school’s orchestra or chamber groups, and performed in Rome, Milan and other cities as part of the System of Italian Youth Orchestras.', '2023-08-22 17:09:08.512', '2023-10-27 17:23:17.602', '2023-08-22 17:09:09.436', 1, 1, 'en');
INSERT INTO public.schools (id, school_name, degree_name, degree_url, grade, start, "end", description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (7, 'Liceo Scientifico "A. Moro"', 'High School', 'https://www.liceomoro.edu.it/', NULL, '2009-09-01', '2014-07-02', '- I attended the ''National Computer Science Plan'' ("PNI") course with a bilingual (English and German) option. This program had a well-rounded curriculum that emphasized both scientific subjects and humanities, including literature, philosophy, and history.

- Within the mathematics course, we had the opportunity to delve into programming, with a focus on algorithms and data structures.

- In addition to my regular coursework, I engaged in various extracurricular activities, such as the school choir, some creative writing contests, elective courses on maths and computer science, and work placements.', '2023-10-27 17:16:49.843', '2023-10-27 17:23:59.323', '2023-10-27 17:16:51.711', 1, 1, 'en');
INSERT INTO public.schools (id, school_name, degree_name, degree_url, grade, start, "end", description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (2, 'Free University of Bolzano', 'BSc in Computer Science', 'https://www.unibz.it/en/faculties/engineering/bachelor-computer-science/', '106/110', '2014-09-01', '2017-01-07', '- The only Italian university that offers a BSc in Computer Science taught in English.

- Trilingual teaching with an international curriculum 🇬🇧 🇮🇹 🇩🇪 , and among the ten world''s best small universities (Times Higher Education 2017).

- The BSc Dissertation project explored SATD ("Self-Admitted Technical Debt") types in open-source projects, and the impact of technical debt on complex systems.', '2023-08-22 17:03:14.422', '2023-10-04 17:07:50.272', '2023-08-22 17:03:15.765', 1, 1, 'en');


--
-- Data for Name: schools_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.schools_localizations_links (id, school_id, inv_school_id, school_order) VALUES (1, 5, 1, 1);
INSERT INTO public.schools_localizations_links (id, school_id, inv_school_id, school_order) VALUES (2, 1, 5, 1);


--
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.skills (id, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (6, 'React, Angular, Vue', 'I''ve had the opportunity to work with the three major front-end frameworks in my career, and picking a favorite isn''t easy. 

To stay versatile, I''ve made sure to master the fundamentals of all three. This way, I''m always well-prepared for the task at hand and I can confidently work with any of them as needed.', '2023-10-07 21:17:48.312', '2023-10-21 11:10:31.443', '2023-10-07 21:17:49.889', 1, 1, 'en', 2);
INSERT INTO public.skills (id, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (1, 'Python', 'I taught myself Python and it quickly became one of my favourite languages.
I mainly used it to develop an automated assessment tool for CompSci programming assignments, which was the focus of my MSc Dissertation.', '2023-08-22 19:32:13.002', '2023-10-21 11:12:06.319', '2023-08-22 19:32:17.14', 1, 1, 'en', 6);
INSERT INTO public.skills (id, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (11, 'C#', 'Medicus, an online store web application designed for selling medical products, was a collaborative project I participated in during my BSc Information Security course. Built using ASP.NET, this project placed a strong emphasis on ensuring the security and privacy of our customers.', '2023-10-08 14:52:34.023', '2023-10-08 14:55:31.728', '2023-10-08 14:52:36.491', 1, 1, 'en', 9);
INSERT INTO public.skills (id, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (3, 'Python', 'Ho imparato Python da autodidatta ed è diventato rapidamente uno dei miei linguaggi preferiti.
L''ho usato principalmente lo sviluppo di uno strumento di valutazione automatica per i compiti di programmazione del corso "Software Engineering" all''università di Manchester, che è stato il fulcro della mia tesi di laurea magistrale.', '2023-10-07 07:53:20.819', '2023-10-21 11:12:06.375', '2023-10-07 07:54:50.743', 1, 1, 'it', 6);
INSERT INTO public.skills (id, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (5, 'Javascript / Typescript', 'I immersed myself in JavaScript during my work placements, subsequently transitioning to TypeScript for the majority of my projects. 
I also possess a strong familiarity with the Node.js ecosystem, where Express.js is often my go-to framework for developing APIs.', '2023-10-07 21:08:04.198', '2023-10-21 11:13:33.352', '2023-10-07 21:08:05.884', 1, 1, 'en', 4);
INSERT INTO public.skills (id, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (2, 'Java', 'I have 7+ years of hands-on experience with Java, during which I''ve delivered a range of projects spanning academia, work, and personal initiatives. Among these are a Library Manager and a Restaurant Order Management app. I''m particularly familiar with the Spring Boot framework, which I mainly utilise for my backend development.

Check out more of my projects [here](/projects).', '2023-08-22 19:37:46.325', '2023-10-08 15:29:36.36', '2023-08-22 19:37:47.617', 1, 1, 'en', 1);
INSERT INTO public.skills (id, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (4, 'Java', 'Lavoro con Java da più di 7 anni e ho realizzato diversi progetti universitari, lavorativi e personali, tra cui un gestore di biblioteche e un''applicazione per la gestione degli ordini di un ristorante con JSP. 

Trovi i miei progetti [qui](/progetti).', '2023-10-07 07:54:37.605', '2023-10-08 15:29:36.426', '2023-10-07 07:54:40.855', 1, 1, 'it', 1);
INSERT INTO public.skills (id, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (10, 'Cloud Platforms', 'During my early years in uni, I heavily relied on my *localhost*. I soon recognized the importance of expanding my skills to include server deployment on cloud platforms. While there''s still much to explore, especially within the ecosystems of AWS and GCP, I''ve found Heroku to be a personal favorite for its user-friendly nature (and the free tier).', '2023-10-08 14:48:41.022', '2023-10-08 15:30:52.56', '2023-10-08 14:48:42.971', 1, 1, 'en', 11);
INSERT INTO public.skills (id, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (8, 'Web & UIs', 'Working on the front-end is always good fun and gives me the chance to explore frameworks like Tailwind, Bootstrap and UI design techniques. I''ve built web apps for various uni, work and personal projects - [check them out](/projects).', '2023-10-07 21:40:44.655', '2023-10-07 21:41:09.98', '2023-10-07 21:40:46.197', 1, 1, 'en', 5);
INSERT INTO public.skills (id, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (9, 'Mobile development', 'I''ve started learning Kotlin a few years ago, as I''m intrigued by its features and possibilities for mobile development. For now I''ve created a few simple apps, and I''m also looking to learn frameworks like Flutter and React Native, or specifically Swift for iOS development.', '2023-10-07 21:43:01.665', '2023-10-07 21:43:02.805', '2023-10-07 21:43:02.798', 1, 1, 'en', 7);
INSERT INTO public.skills (id, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (7, 'PHP', 'The booking management service of my previous company was written in PHP - kind of a shock therapy experience, still an excellent chance to learn about this language. Since then, I''ve continued to work particularly within the context of Drupal. There''s still much more to explore and discover, but I like challenges.', '2023-10-07 21:27:54.017', '2023-10-08 15:31:35.095', '2023-10-07 21:27:55.6', 1, 1, 'en', 10);
INSERT INTO public.skills (id, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (13, 'Databases', 'A Library Manager was the project that introduced me to complex relational DB architectures. Since then I designed several systems for personal and work projects, mostly with Postgres and MySQL, as well as MongoDB and Firestore in the NoSQL world.', '2023-10-08 15:17:08.547', '2023-10-08 15:31:47.47', '2023-10-08 15:17:10.516', 1, 1, 'en', 8);
INSERT INTO public.skills (id, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, rank) VALUES (12, 'APIs', 'I possess extensive experience developing APIs, in particular using the REST architecture. For example, at Booking.com I maintained the Suppliers API - an aggregator service that communicates with hundreds of car rental systems, sending order requests, updates and cancellations. More recently I delved into the realm of GraphQL.', '2023-10-08 15:11:01.676', '2023-10-08 15:12:57.117', '2023-10-08 15:11:04.333', 1, 1, 'en', 3);


--
-- Data for Name: skills_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.skills_localizations_links (id, skill_id, inv_skill_id, skill_order) VALUES (1, 3, 1, 1);
INSERT INTO public.skills_localizations_links (id, skill_id, inv_skill_id, skill_order) VALUES (2, 1, 3, 1);
INSERT INTO public.skills_localizations_links (id, skill_id, inv_skill_id, skill_order) VALUES (3, 4, 2, 1);
INSERT INTO public.skills_localizations_links (id, skill_id, inv_skill_id, skill_order) VALUES (4, 2, 4, 1);


--
-- Data for Name: software_development_intros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.software_development_intros (id, title, content, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (1, 'Software Development', 'Software development has been not only my profession but also my enduring passion for the past 8 years. Below, I''ve provided a glimpse into my key technical skill sets and the technologies that have become integral to my work. 

Want to find out more about my experience? Feel free to browse my [project portfolio](/projects), or [download this CV](/downloads/cv.pdf) in PDF format.', '2023-08-22 20:02:30.679', '2023-09-14 16:16:28.206', '2023-08-22 20:02:40.423', 1, 1, 'en');


--
-- Data for Name: software_development_intros_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
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

INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (3, 'plugin_content_manager_configuration_content_types::admin::role', '{"uid":"admin::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (4, 'plugin_content_manager_configuration_content_types::plugin::upload.file', '{"uid":"plugin::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (2, 'plugin_content_manager_configuration_content_types::admin::user', '{"uid":"admin::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (15, 'plugin_upload_settings', '{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (18, 'plugin_users-permissions_grant', '{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"enabled":false,"icon":"","key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (19, 'plugin_users-permissions_email', '{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\n\n<p>But don’t worry! You can use the following link to reset your password:</p>\n<p><%= URL %>?code=<%= TOKEN %></p>\n\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\n\n<p>You have to confirm your email address. Please click on the link below.</p>\n\n<p><%= URL %>?confirmation=<%= CODE %></p>\n\n<p>Thanks.</p>"}}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (20, 'plugin_users-permissions_advanced', '{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (10, 'plugin_content_manager_configuration_content_types::admin::api-token', '{"uid":"admin::api-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (12, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.permission', '{"uid":"plugin::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (27, 'plugin_documentation_config', '{"restrictedAccess":false}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (16, 'plugin_upload_view_configuration', '{"pageSize":20,"sort":"createdAt:DESC"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (1, 'strapi_content_types_schema', '{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token-permission","connection":"default","uid":"admin::api-token-permission","plugin":"admin","globalId":"AdminApiTokenPermission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token","connection":"default","uid":"admin::transfer-token","plugin":"admin","globalId":"AdminTransferToken"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token-permission","connection":"default","uid":"admin::transfer-token-permission","plugin":"admin","globalId":"AdminTransferTokenPermission"},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"folder","connection":"default","uid":"plugin::upload.folder","plugin":"upload","globalId":"UploadFolder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"},"plugin::menus.menu":{"kind":"collectionType","collectionName":"menus","info":{"displayName":"Menu","singularName":"menu","pluralName":"menus","tableName":"menus"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"title":{"type":"string","required":true},"slug":{"type":"uid","targetField":"title","required":true},"items":{"type":"relation","relation":"oneToMany","target":"plugin::menus.menu-item","mappedBy":"root_menu"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"menus","info":{"displayName":"Menu","singularName":"menu","pluralName":"menus","tableName":"menus"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"title":{"type":"string","required":true},"slug":{"type":"uid","targetField":"title","required":true},"items":{"type":"relation","relation":"oneToMany","target":"plugin::menus.menu-item","mappedBy":"root_menu"}},"kind":"collectionType"},"modelType":"contentType","modelName":"menu","connection":"default","uid":"plugin::menus.menu","plugin":"menus","globalId":"MenusMenu"},"plugin::menus.menu-item":{"kind":"collectionType","collectionName":"menu_items","info":{"displayName":"Menu Item","singularName":"menu-item","pluralName":"menu-items","tableName":"menu_items"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"order":{"type":"integer"},"title":{"type":"string","required":true},"url":{"type":"string"},"target":{"type":"enumeration","enum":["_blank","_parent","_self","_top"]},"root_menu":{"type":"relation","relation":"manyToOne","target":"plugin::menus.menu","inversedBy":"items","required":true},"parent":{"type":"relation","relation":"oneToOne","target":"plugin::menus.menu-item"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"menu_items","info":{"displayName":"Menu Item","singularName":"menu-item","pluralName":"menu-items","tableName":"menu_items"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"order":{"type":"integer"},"title":{"type":"string","required":true},"url":{"type":"string"},"target":{"type":"enumeration","enum":["_blank","_parent","_self","_top"]},"root_menu":{"type":"relation","relation":"manyToOne","target":"plugin::menus.menu","inversedBy":"items","required":true},"parent":{"type":"relation","relation":"oneToOne","target":"plugin::menus.menu-item"}},"kind":"collectionType"},"modelType":"contentType","modelName":"menu-item","connection":"default","uid":"plugin::menus.menu-item","plugin":"menus","globalId":"MenusMenuItem"},"plugin::react-icons.iconlibrary":{"kind":"collectionType","collectionName":"iconlibrary","info":{"singularName":"iconlibrary","pluralName":"iconlibraries","displayName":"IconLibrary"},"options":{"draftAndPublish":false,"comment":""},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"abbreviation":{"type":"string","required":true,"unique":true,"maxLength":3},"isEnabled":{"type":"boolean","default":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"iconlibrary","info":{"singularName":"iconlibrary","pluralName":"iconlibraries","displayName":"IconLibrary"},"options":{"draftAndPublish":false,"comment":""},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"abbreviation":{"type":"string","required":true,"unique":true,"maxLength":3},"isEnabled":{"type":"boolean","default":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"iconlibrary","connection":"default","uid":"plugin::react-icons.iconlibrary","plugin":"react-icons","globalId":"ReactIconsIconlibrary"},"api::book.book":{"kind":"collectionType","collectionName":"books","info":{"singularName":"book","pluralName":"books","displayName":"Book","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"author":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"goodreadsLink":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"genre":{"pluginOptions":{"i18n":{"localized":false}},"type":"enumeration","enum":["Fiction","Non-fiction"]},"rank":{"pluginOptions":{"i18n":{"localized":false}},"type":"integer"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::book.book"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"books","info":{"singularName":"book","pluralName":"books","displayName":"Book","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"author":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"goodreadsLink":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"genre":{"pluginOptions":{"i18n":{"localized":false}},"type":"enumeration","enum":["Fiction","Non-fiction"]},"rank":{"pluginOptions":{"i18n":{"localized":false}},"type":"integer"}},"kind":"collectionType"},"modelType":"contentType","modelName":"book","connection":"default","uid":"api::book.book","apiName":"book","globalId":"Book","actions":{},"lifecycles":{}},"api::code-snippet.code-snippet":{"kind":"collectionType","collectionName":"code_snippets","info":{"singularName":"code-snippet","pluralName":"code-snippets","displayName":"Code Snippet","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"language":{"type":"string"},"code":{"type":"richtext"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"code_snippets","info":{"singularName":"code-snippet","pluralName":"code-snippets","displayName":"Code Snippet","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"language":{"type":"string"},"code":{"type":"richtext"}},"kind":"collectionType"},"modelType":"contentType","modelName":"code-snippet","connection":"default","uid":"api::code-snippet.code-snippet","apiName":"code-snippet","globalId":"CodeSnippet","actions":{},"lifecycles":{}},"api::home-page.home-page":{"kind":"singleType","collectionName":"home_pages","info":{"singularName":"home-page","pluralName":"home-pages","displayName":"Home Page","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"greeting":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"string"},"introduction_1":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"introduction_2":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"introduction_3":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"introduction_4":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"introduction_5":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::home-page.home-page"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"home_pages","info":{"singularName":"home-page","pluralName":"home-pages","displayName":"Home Page","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"greeting":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"string"},"introduction_1":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"introduction_2":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"introduction_3":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"introduction_4":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"introduction_5":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"}},"kind":"singleType"},"modelType":"contentType","modelName":"home-page","connection":"default","uid":"api::home-page.home-page","apiName":"home-page","globalId":"HomePage","actions":{},"lifecycles":{}},"api::job.job":{"kind":"collectionType","collectionName":"jobs","info":{"singularName":"job","pluralName":"jobs","displayName":"Job","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"companyName":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"icon":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"location":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"startDate":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"endDate":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"isCurrentJob":{"pluginOptions":{"i18n":{"localized":false}},"type":"boolean"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"mainColor":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","regex":"^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$","customField":"plugin::color-picker.color"},"darkColor":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","regex":"^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$","customField":"plugin::color-picker.color"},"technologies":{"pluginOptions":{"i18n":{"localized":false}},"type":"json"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::job.job"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"jobs","info":{"singularName":"job","pluralName":"jobs","displayName":"Job","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"companyName":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"icon":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"location":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"startDate":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"endDate":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"isCurrentJob":{"pluginOptions":{"i18n":{"localized":false}},"type":"boolean"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"mainColor":{"pluginOptions":{"i18n":{"localized":false}},"type":"customField","regex":"^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$","customField":"plugin::color-picker.color"},"darkColor":{"pluginOptions":{"i18n":{"localized":false}},"type":"customField","regex":"^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$","customField":"plugin::color-picker.color"},"technologies":{"pluginOptions":{"i18n":{"localized":false}},"type":"json"}},"kind":"collectionType"},"modelType":"contentType","modelName":"job","connection":"default","uid":"api::job.job","apiName":"job","globalId":"Job","actions":{},"lifecycles":{}},"api::language.language":{"kind":"collectionType","collectionName":"languages","info":{"singularName":"language","pluralName":"languages","displayName":"Language","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"level":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"flag":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"rank":{"pluginOptions":{"i18n":{"localized":true}},"type":"integer"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::language.language"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"languages","info":{"singularName":"language","pluralName":"languages","displayName":"Language","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"level":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"flag":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"rank":{"pluginOptions":{"i18n":{"localized":true}},"type":"integer"}},"kind":"collectionType"},"modelType":"contentType","modelName":"language","connection":"default","uid":"api::language.language","apiName":"language","globalId":"Language","actions":{},"lifecycles":{}},"api::podcast.podcast":{"kind":"collectionType","collectionName":"podcasts","info":{"singularName":"podcast","pluralName":"podcasts","displayName":"Podcast"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"author":{"type":"string"},"language":{"type":"enumeration","enum":["en","it"]},"cover":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"mediaLink":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"podcasts","info":{"singularName":"podcast","pluralName":"podcasts","displayName":"Podcast"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"author":{"type":"string"},"language":{"type":"enumeration","enum":["en","it"]},"cover":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"mediaLink":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"podcast","connection":"default","uid":"api::podcast.podcast","apiName":"podcast","globalId":"Podcast","actions":{},"lifecycles":{}},"api::project.project":{"kind":"collectionType","collectionName":"projects","info":{"singularName":"project","pluralName":"projects","displayName":"Project","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"string"},"image":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":false}}},"shortDescription":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"text"},"tools":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":false}},"type":"string"},"date":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":false}},"type":"date"},"tags":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"string"},"links":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":false}},"type":"json"},"longDescription":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::project.project"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"projects","info":{"singularName":"project","pluralName":"projects","displayName":"Project","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"string"},"image":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":false}}},"shortDescription":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"text"},"tools":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":false}},"type":"string"},"date":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":false}},"type":"date"},"tags":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"string"},"links":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":false}},"type":"json"},"longDescription":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"}},"kind":"collectionType"},"modelType":"contentType","modelName":"project","connection":"default","uid":"api::project.project","apiName":"project","globalId":"Project","actions":{},"lifecycles":{}},"api::publication.publication":{"kind":"collectionType","collectionName":"publications","info":{"singularName":"publication","pluralName":"publications","displayName":"Publication","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","pluginOptions":{"i18n":{"localized":false}}},"description":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"publisher":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"year":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"rank":{"pluginOptions":{"i18n":{"localized":true}},"type":"integer"},"fileUrl":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::publication.publication"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"publications","info":{"singularName":"publication","pluralName":"publications","displayName":"Publication","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","pluginOptions":{"i18n":{"localized":false}}},"description":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"publisher":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"year":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"rank":{"pluginOptions":{"i18n":{"localized":true}},"type":"integer"},"fileUrl":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"publication","connection":"default","uid":"api::publication.publication","apiName":"publication","globalId":"Publication","actions":{},"lifecycles":{}},"api::random-fact.random-fact":{"kind":"collectionType","collectionName":"random_facts","info":{"singularName":"random-fact","pluralName":"random-facts","displayName":"Random Fact","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"headline":{"pluginOptions":{"i18n":{"localized":true}},"type":"text"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"isFactTrue":{"pluginOptions":{"i18n":{"localized":false}},"type":"boolean","default":true},"explanation":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::random-fact.random-fact"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"random_facts","info":{"singularName":"random-fact","pluralName":"random-facts","displayName":"Random Fact","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"headline":{"pluginOptions":{"i18n":{"localized":true}},"type":"text"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"isFactTrue":{"pluginOptions":{"i18n":{"localized":false}},"type":"boolean","default":true},"explanation":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"}},"kind":"collectionType"},"modelType":"contentType","modelName":"random-fact","connection":"default","uid":"api::random-fact.random-fact","apiName":"random-fact","globalId":"RandomFact","actions":{},"lifecycles":{}},"api::recruiters-page.recruiters-page":{"kind":"singleType","collectionName":"recruiters_pages","info":{"singularName":"recruiters-page","pluralName":"recruiters-pages","displayName":"Recruiters Page","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"jobPreferences":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"tldr":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"salary":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"toolsTechs":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"generalInfo":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"intro":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"outro":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::recruiters-page.recruiters-page"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"recruiters_pages","info":{"singularName":"recruiters-page","pluralName":"recruiters-pages","displayName":"Recruiters Page","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"jobPreferences":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"tldr":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"salary":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"toolsTechs":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"generalInfo":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"intro":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"outro":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"}},"kind":"singleType"},"modelType":"contentType","modelName":"recruiters-page","connection":"default","uid":"api::recruiters-page.recruiters-page","apiName":"recruiters-page","globalId":"RecruitersPage","actions":{},"lifecycles":{}},"api::school.school":{"kind":"collectionType","collectionName":"schools","info":{"singularName":"school","pluralName":"schools","displayName":"School"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"schoolName":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"flag":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}}},"degreeName":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"degreeUrl":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"grade":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"start":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"end":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"icon":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::school.school"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"schools","info":{"singularName":"school","pluralName":"schools","displayName":"School"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"schoolName":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"flag":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}}},"degreeName":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"degreeUrl":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"grade":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"start":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"end":{"pluginOptions":{"i18n":{"localized":false}},"type":"date"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"icon":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}}}},"kind":"collectionType"},"modelType":"contentType","modelName":"school","connection":"default","uid":"api::school.school","apiName":"school","globalId":"School","actions":{},"lifecycles":{}},"api::skill.skill":{"kind":"collectionType","collectionName":"skills","info":{"singularName":"skill","pluralName":"skills","displayName":"Skill","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"icons":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"rank":{"pluginOptions":{"i18n":{"localized":false}},"type":"integer"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::skill.skill"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"skills","info":{"singularName":"skill","pluralName":"skills","displayName":"Skill","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext"},"icons":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"rank":{"pluginOptions":{"i18n":{"localized":false}},"type":"integer"}},"kind":"collectionType"},"modelType":"contentType","modelName":"skill","connection":"default","uid":"api::skill.skill","apiName":"skill","globalId":"Skill","actions":{},"lifecycles":{}},"api::software-development-intro.software-development-intro":{"kind":"singleType","collectionName":"software_development_intros","info":{"singularName":"software-development-intro","pluralName":"software-development-intros","displayName":"Software Dev Intro","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"string"},"content":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"icon":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":false}}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::software-development-intro.software-development-intro"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"software_development_intros","info":{"singularName":"software-development-intro","pluralName":"software-development-intros","displayName":"Software Dev Intro","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"string"},"content":{"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"type":"richtext"},"icon":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":false}}}},"kind":"singleType"},"modelType":"contentType","modelName":"software-development-intro","connection":"default","uid":"api::software-development-intro.software-development-intro","apiName":"software-development-intro","globalId":"SoftwareDevelopmentIntro","actions":{},"lifecycles":{}},"api::tv-show.tv-show":{"kind":"collectionType","collectionName":"tv_shows","info":{"singularName":"tv-show","pluralName":"tv-shows","displayName":"TvShow","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"poster":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"link":{"type":"string"},"year":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"tv_shows","info":{"singularName":"tv-show","pluralName":"tv-shows","displayName":"TvShow","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"poster":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"link":{"type":"string"},"year":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"tv-show","connection":"default","uid":"api::tv-show.tv-show","apiName":"tv-show","globalId":"TvShow","actions":{},"lifecycles":{}},"api::uses-page.uses-page":{"kind":"singleType","collectionName":"uses_pages","info":{"singularName":"uses-page","pluralName":"uses-pages","displayName":"Uses Page","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"hardware":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"media":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"programmingTools":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"security":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"productivity":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::uses-page.uses-page"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"uses_pages","info":{"singularName":"uses-page","pluralName":"uses-pages","displayName":"Uses Page","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"hardware":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"media":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"programmingTools":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"security":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"},"productivity":{"type":"component","repeatable":false,"pluginOptions":{"versions":{"versioned":true},"i18n":{"localized":true}},"component":"shared.titled-paragraph"}},"kind":"singleType"},"modelType":"contentType","modelName":"uses-page","connection":"default","uid":"api::uses-page.uses-page","apiName":"uses-page","globalId":"UsesPage","actions":{},"lifecycles":{}},"api::video-game.video-game":{"kind":"collectionType","collectionName":"video_games","info":{"singularName":"video-game","pluralName":"video-games","displayName":"VideoGame","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"link":{"type":"string"},"year":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"video_games","info":{"singularName":"video-game","pluralName":"video-games","displayName":"VideoGame","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"link":{"type":"string"},"year":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"video-game","connection":"default","uid":"api::video-game.video-game","apiName":"video-game","globalId":"VideoGame","actions":{},"lifecycles":{}}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (13, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.role', '{"uid":"plugin::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (24, 'plugin_content_manager_configuration_content_types::plugin::menus.menu', '{"uid":"plugin::menus.menu","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"items":{"edit":{"label":"items","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"items","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","slug","items"],"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"items","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (22, 'core_admin_auth', '{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (31, 'plugin_drag-drop-content-types_settings', '{"body":{"rank":"rank","title":""}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (6, 'plugin_content_manager_configuration_content_types::admin::transfer-token-permission', '{"uid":"admin::transfer-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (8, 'plugin_content_manager_configuration_content_types::admin::permission', '{"uid":"admin::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6},{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}],[{"name":"actionParameters","size":12}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (21, 'plugin_i18n_default_locale', '"en"', 'string', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (42, 'plugin_content_manager_configuration_content_types::api::random-fact.random-fact', '{"uid":"api::random-fact.random-fact","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"name","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"headline":{"edit":{"label":"headline","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"headline","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":false,"sortable":false}},"isFactTrue":{"edit":{"label":"isFactTrue","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isFactTrue","searchable":true,"sortable":true}},"explanation":{"edit":{"label":"explanation","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"explanation","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","headline","isFactTrue"],"edit":[[{"name":"name","size":6},{"name":"headline","size":6}],[{"name":"description","size":12}],[{"name":"isFactTrue","size":4}],[{"name":"explanation","size":12}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (25, 'plugin_content_manager_configuration_content_types::plugin::react-icons.iconlibrary', '{"uid":"plugin::react-icons.iconlibrary","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"abbreviation":{"edit":{"label":"abbreviation","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"abbreviation","searchable":true,"sortable":true}},"isEnabled":{"edit":{"label":"isEnabled","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEnabled","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","abbreviation","isEnabled"],"edit":[[{"name":"name","size":6},{"name":"abbreviation","size":6}],[{"name":"isEnabled","size":4}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (38, 'plugin_content_manager_configuration_content_types::api::publication.publication', '{"uid":"api::publication.publication","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"publisher":{"edit":{"label":"publisher","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"publisher","searchable":true,"sortable":true}},"year":{"edit":{"label":"year","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"year","searchable":true,"sortable":true}},"rank":{"edit":{"label":"rank","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"rank","searchable":true,"sortable":true}},"fileUrl":{"edit":{"label":"fileUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"fileUrl","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","description","publisher"],"edit":[[{"name":"title","size":6},{"name":"description","size":6}],[{"name":"publisher","size":6}],[{"name":"year","size":4}],[{"name":"rank","size":4},{"name":"fileUrl","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (11, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.user', '{"uid":"plugin::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (23, 'plugin_content_manager_configuration_content_types::api::job.job', '{"uid":"api::job.job","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"companyName","defaultSortBy":"startDate","defaultSortOrder":"DESC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"companyName":{"edit":{"label":"companyName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"companyName","searchable":true,"sortable":true}},"icon":{"edit":{"label":"icon","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icon","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"location":{"edit":{"label":"location","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"location","searchable":true,"sortable":true}},"startDate":{"edit":{"label":"startDate","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"startDate","searchable":true,"sortable":true}},"endDate":{"edit":{"label":"endDate","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"endDate","searchable":true,"sortable":true}},"isCurrentJob":{"edit":{"label":"isCurrentJob","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isCurrentJob","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":false,"sortable":false}},"mainColor":{"edit":{"label":"mainColor","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mainColor","searchable":true,"sortable":true}},"darkColor":{"edit":{"label":"darkColor","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"darkColor","searchable":true,"sortable":true}},"technologies":{"edit":{"label":"technologies","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"technologies","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","companyName","icon","title"],"edit":[[{"name":"companyName","size":6},{"name":"icon","size":6}],[{"name":"title","size":6},{"name":"location","size":6}],[{"name":"startDate","size":4},{"name":"endDate","size":4},{"name":"isCurrentJob","size":4}],[{"name":"description","size":12}],[{"name":"mainColor","size":6},{"name":"darkColor","size":6}],[{"name":"technologies","size":12}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (26, 'plugin_content_manager_configuration_content_types::plugin::menus.menu-item', '{"uid":"plugin::menus.menu-item","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"order":{"edit":{"label":"order","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"order","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"target":{"edit":{"label":"target","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"target","searchable":true,"sortable":true}},"root_menu":{"edit":{"label":"root_menu","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"root_menu","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"parent","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","order","title","url"],"edit":[[{"name":"order","size":4},{"name":"title","size":6}],[{"name":"url","size":6},{"name":"target","size":6}],[{"name":"root_menu","size":6},{"name":"parent","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (32, 'plugin_content_manager_configuration_content_types::api::book.book', '{"uid":"api::book.book","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"author":{"edit":{"label":"author","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"author","searchable":true,"sortable":true}},"cover":{"edit":{"label":"cover","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cover","searchable":false,"sortable":false}},"goodreadsLink":{"edit":{"label":"goodreadsLink","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"goodreadsLink","searchable":true,"sortable":true}},"genre":{"edit":{"label":"genre","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"genre","searchable":true,"sortable":true}},"rank":{"edit":{"label":"rank","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"rank","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","author","cover"],"edit":[[{"name":"title","size":6},{"name":"author","size":6}],[{"name":"cover","size":6},{"name":"goodreadsLink","size":6}],[{"name":"genre","size":6},{"name":"rank","size":4}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (28, 'plugin_responsive-image_settings', '{"formats":[{"name":"large","width":1000,"fit":"cover","position":"centre","withoutEnlargement":false,"convertToFormat":""},{"name":"medium","width":750,"fit":"cover","position":"centre","withoutEnlargement":false,"convertToFormat":""},{"name":"small","width":500,"fit":"cover","position":"centre","withoutEnlargement":false,"convertToFormat":""}],"quality":87,"progressive":true}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (29, 'plugin_content_manager_configuration_components::shared.meta-social', '{"uid":"shared.meta-social","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"socialNetwork":{"edit":{"label":"socialNetwork","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"socialNetwork","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}}},"layouts":{"list":["id","socialNetwork","title","description"],"edit":[[{"name":"socialNetwork","size":6},{"name":"title","size":6}],[{"name":"description","size":6},{"name":"image","size":6}]]},"isComponent":true}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (30, 'plugin_content_manager_configuration_components::shared.seo', '{"uid":"shared.seo","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"metaTitle","defaultSortBy":"metaTitle","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"metaTitle":{"edit":{"label":"metaTitle","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaTitle","searchable":true,"sortable":true}},"metaDescription":{"edit":{"label":"metaDescription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaDescription","searchable":true,"sortable":true}},"metaImage":{"edit":{"label":"metaImage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaImage","searchable":false,"sortable":false}},"metaSocial":{"edit":{"label":"metaSocial","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaSocial","searchable":false,"sortable":false}},"keywords":{"edit":{"label":"keywords","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"keywords","searchable":true,"sortable":true}},"metaRobots":{"edit":{"label":"metaRobots","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaRobots","searchable":true,"sortable":true}},"structuredData":{"edit":{"label":"structuredData","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"structuredData","searchable":false,"sortable":false}},"metaViewport":{"edit":{"label":"metaViewport","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaViewport","searchable":true,"sortable":true}},"canonicalURL":{"edit":{"label":"canonicalURL","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"canonicalURL","searchable":true,"sortable":true}}},"layouts":{"list":["id","metaTitle","metaDescription","metaImage"],"edit":[[{"name":"metaTitle","size":6},{"name":"metaDescription","size":6}],[{"name":"metaImage","size":6}],[{"name":"metaSocial","size":12}],[{"name":"keywords","size":6},{"name":"metaRobots","size":6}],[{"name":"structuredData","size":12}],[{"name":"metaViewport","size":6},{"name":"canonicalURL","size":6}]]},"isComponent":true}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (7, 'plugin_content_manager_configuration_content_types::plugin::upload.folder', '{"uid":"plugin::upload.folder","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (41, 'plugin_content_manager_configuration_content_types::api::software-development-intro.software-development-intro', '{"uid":"api::software-development-intro.software-development-intro","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"icon":{"edit":{"label":"icon","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icon","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","icon","createdAt"],"edit":[[{"name":"title","size":6}],[{"name":"content","size":12}],[{"name":"icon","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (44, 'plugin_content_manager_configuration_content_types::api::project.project', '{"uid":"api::project.project","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"shortDescription":{"edit":{"label":"shortDescription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"shortDescription","searchable":true,"sortable":true}},"tools":{"edit":{"label":"tools","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"tools","searchable":true,"sortable":true}},"date":{"edit":{"label":"date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"date","searchable":true,"sortable":true}},"tags":{"edit":{"label":"tags","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"tags","searchable":true,"sortable":true}},"links":{"edit":{"label":"links","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"links","searchable":false,"sortable":false}},"longDescription":{"edit":{"label":"longDescription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"longDescription","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","image","shortDescription"],"edit":[[{"name":"title","size":6},{"name":"image","size":6}],[{"name":"shortDescription","size":6}],[{"name":"tools","size":6},{"name":"date","size":4}],[{"name":"tags","size":6}],[{"name":"links","size":12}],[{"name":"longDescription","size":12}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (17, 'plugin_upload_metrics', '{"weeklySchedule":"3 4 18 * * 1","lastWeeklyUpdate":1698689043040}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (45, 'plugin_content_manager_configuration_components::shared.titled-paragraph', '{"uid":"shared.titled-paragraph","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"outro":{"edit":{"label":"outro","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"outro","searchable":false,"sortable":false}}},"layouts":{"list":["id","title"],"edit":[[{"name":"title","size":6}],[{"name":"content","size":12}],[{"name":"outro","size":12}]]},"isComponent":true}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (34, 'plugin_content_manager_configuration_content_types::api::podcast.podcast', '{"uid":"api::podcast.podcast","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"author":{"edit":{"label":"author","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"author","searchable":true,"sortable":true}},"language":{"edit":{"label":"language","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"language","searchable":true,"sortable":true}},"cover":{"edit":{"label":"cover","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cover","searchable":false,"sortable":false}},"mediaLink":{"edit":{"label":"mediaLink","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mediaLink","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","author","language"],"edit":[[{"name":"name","size":6},{"name":"author","size":6}],[{"name":"language","size":6},{"name":"cover","size":6}],[{"name":"mediaLink","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (40, 'plugin_content_manager_configuration_content_types::api::code-snippet.code-snippet', '{"uid":"api::code-snippet.code-snippet","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"language","defaultSortBy":"language","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"language":{"edit":{"label":"language","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"language","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","language","createdAt","createdBy"],"edit":[[{"name":"language","size":6}],[{"name":"code","size":12}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (5, 'plugin_content_manager_configuration_content_types::admin::transfer-token', '{"uid":"admin::transfer-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (43, 'plugin_content_manager_configuration_content_types::api::home-page.home-page', '{"uid":"api::home-page.home-page","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"greeting","defaultSortBy":"greeting","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"greeting":{"edit":{"label":"greeting","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"greeting","searchable":true,"sortable":true}},"introduction_1":{"edit":{"label":"introduction_1","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"introduction_1","searchable":false,"sortable":false}},"introduction_2":{"edit":{"label":"introduction_2","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"introduction_2","searchable":false,"sortable":false}},"introduction_3":{"edit":{"label":"introduction_3","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"introduction_3","searchable":false,"sortable":false}},"introduction_4":{"edit":{"label":"introduction_4","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"introduction_4","searchable":false,"sortable":false}},"introduction_5":{"edit":{"label":"introduction_5","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"introduction_5","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","greeting","createdAt","updatedAt"],"edit":[[{"name":"greeting","size":6}],[{"name":"introduction_1","size":12}],[{"name":"introduction_2","size":12}],[{"name":"introduction_3","size":12}],[{"name":"introduction_4","size":12}],[{"name":"introduction_5","size":12}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (36, 'plugin_content_manager_configuration_content_types::api::school.school', '{"uid":"api::school.school","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"schoolName","defaultSortBy":"start","defaultSortOrder":"DESC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"schoolName":{"edit":{"label":"schoolName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"schoolName","searchable":true,"sortable":true}},"flag":{"edit":{"label":"flag","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"flag","searchable":false,"sortable":false}},"degreeName":{"edit":{"label":"degreeName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"degreeName","searchable":true,"sortable":true}},"degreeUrl":{"edit":{"label":"degreeUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"degreeUrl","searchable":true,"sortable":true}},"grade":{"edit":{"label":"grade","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"grade","searchable":true,"sortable":true}},"start":{"edit":{"label":"start","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"start","searchable":true,"sortable":true}},"end":{"edit":{"label":"end","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"end","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":false,"sortable":false}},"icon":{"edit":{"label":"icon","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icon","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","icon","schoolName","degreeName"],"edit":[[{"name":"schoolName","size":6}],[{"name":"degreeName","size":6},{"name":"degreeUrl","size":6}],[{"name":"grade","size":6}],[{"name":"start","size":4},{"name":"end","size":4}],[{"name":"description","size":12}],[{"name":"icon","size":6},{"name":"flag","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (47, 'plugin_content_manager_configuration_content_types::api::uses-page.uses-page', '{"uid":"api::uses-page.uses-page","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"hardware":{"edit":{"label":"hardware","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hardware","searchable":false,"sortable":false}},"programmingTools":{"edit":{"label":"programmingTools","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"programmingTools","searchable":false,"sortable":false}},"productivity":{"edit":{"label":"productivity","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"productivity","searchable":false,"sortable":false}},"security":{"edit":{"label":"security","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"security","searchable":false,"sortable":false}},"media":{"edit":{"label":"media","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"media","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","createdAt","updatedAt","createdBy"],"edit":[[{"name":"hardware","size":12}],[{"name":"programmingTools","size":12}],[{"name":"productivity","size":12}],[{"name":"security","size":12}],[{"name":"media","size":12}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (9, 'plugin_content_manager_configuration_content_types::admin::api-token-permission', '{"uid":"admin::api-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (14, 'plugin_content_manager_configuration_content_types::plugin::i18n.locale', '{"uid":"plugin::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (35, 'plugin_content_manager_configuration_content_types::api::skill.skill', '{"uid":"api::skill.skill","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":false,"sortable":false}},"icons":{"edit":{"label":"icons","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icons","searchable":false,"sortable":false}},"rank":{"edit":{"label":"rank","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"rank","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","icons","createdAt"],"edit":[[{"name":"title","size":6}],[{"name":"description","size":12}],[{"name":"icons","size":6},{"name":"rank","size":4}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (39, 'plugin_content_manager_configuration_content_types::api::video-game.video-game', '{"uid":"api::video-game.video-game","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":20,"mainField":"title","defaultSortBy":"year","defaultSortOrder":"DESC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"cover":{"edit":{"label":"cover","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cover","searchable":false,"sortable":false}},"link":{"edit":{"label":"link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"link","searchable":true,"sortable":true}},"year":{"edit":{"label":"year","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"year","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","cover","title","year"],"edit":[[{"name":"title","size":6},{"name":"year","size":4}],[{"name":"cover","size":6},{"name":"link","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (33, 'plugin_content_manager_configuration_content_types::api::language.language', '{"uid":"api::language.language","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"level":{"edit":{"label":"level","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"level","searchable":true,"sortable":true}},"flag":{"edit":{"label":"flag","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"flag","searchable":false,"sortable":false}},"rank":{"edit":{"label":"rank","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"rank","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","level","flag"],"edit":[[{"name":"name","size":6},{"name":"level","size":6}],[{"name":"flag","size":6},{"name":"rank","size":4}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (37, 'plugin_content_manager_configuration_content_types::api::tv-show.tv-show', '{"uid":"api::tv-show.tv-show","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"year","defaultSortOrder":"DESC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"poster":{"edit":{"label":"poster","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"poster","searchable":false,"sortable":false}},"link":{"edit":{"label":"link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"link","searchable":true,"sortable":true}},"year":{"edit":{"label":"year","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"year","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","year","poster"],"edit":[[{"name":"title","size":6},{"name":"year","size":4}],[{"name":"poster","size":6},{"name":"link","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings (id, key, value, type, environment, tag) VALUES (46, 'plugin_content_manager_configuration_content_types::api::recruiters-page.recruiters-page', '{"uid":"api::recruiters-page.recruiters-page","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"jobPreferences":{"edit":{"label":"jobPreferences","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"jobPreferences","searchable":false,"sortable":false}},"tldr":{"edit":{"label":"tldr","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"tldr","searchable":false,"sortable":false}},"salary":{"edit":{"label":"salary","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"salary","searchable":false,"sortable":false}},"toolsTechs":{"edit":{"label":"toolsTechs","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"toolsTechs","searchable":false,"sortable":false}},"generalInfo":{"edit":{"label":"generalInfo","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"generalInfo","searchable":false,"sortable":false}},"intro":{"edit":{"label":"intro","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"intro","searchable":false,"sortable":false}},"outro":{"edit":{"label":"outro","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"outro","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","tldr","salary","jobPreferences"],"edit":[[{"name":"tldr","size":12}],[{"name":"salary","size":12}],[{"name":"toolsTechs","size":12}],[{"name":"jobPreferences","size":12}],[{"name":"generalInfo","size":12}],[{"name":"intro","size":12}],[{"name":"outro","size":12}]]}}', 'object', NULL, NULL);


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.strapi_database_schema (id, schema, "time", hash) VALUES (34, '{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"menus","indexes":[{"type":"unique","name":"menus_slug_unique","columns":["slug"]},{"name":"menus_created_by_id_fk","columns":["created_by_id"]},{"name":"menus_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"menus_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"menus_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"menu_items","indexes":[{"name":"menu_items_created_by_id_fk","columns":["created_by_id"]},{"name":"menu_items_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"menu_items_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"menu_items_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"target","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"iconlibrary","indexes":[{"name":"iconlibrary_created_by_id_fk","columns":["created_by_id"]},{"name":"iconlibrary_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"iconlibrary_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"iconlibrary_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"abbreviation","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"books","indexes":[{"name":"books_created_by_id_fk","columns":["created_by_id"]},{"name":"books_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"books_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"books_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"author","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"goodreads_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"genre","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"rank","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"code_snippets","indexes":[{"name":"code_snippets_created_by_id_fk","columns":["created_by_id"]},{"name":"code_snippets_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"code_snippets_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"code_snippets_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"home_pages","indexes":[{"name":"home_pages_created_by_id_fk","columns":["created_by_id"]},{"name":"home_pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"home_pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"home_pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"greeting","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"introduction_1","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"introduction_2","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"introduction_3","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"introduction_4","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"introduction_5","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"jobs","indexes":[{"name":"jobs_created_by_id_fk","columns":["created_by_id"]},{"name":"jobs_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"jobs_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"jobs_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"company_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"location","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"start_date","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"end_date","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_current_job","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"main_color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"dark_color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"technologies","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"languages","indexes":[{"name":"languages_created_by_id_fk","columns":["created_by_id"]},{"name":"languages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"languages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"languages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"level","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"rank","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"podcasts","indexes":[{"name":"podcasts_created_by_id_fk","columns":["created_by_id"]},{"name":"podcasts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"podcasts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"podcasts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"author","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"media_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"projects","indexes":[{"name":"projects_created_by_id_fk","columns":["created_by_id"]},{"name":"projects_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"projects_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"projects_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"short_description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tools","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"date","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tags","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"links","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"long_description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"publications","indexes":[{"name":"publications_created_by_id_fk","columns":["created_by_id"]},{"name":"publications_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"publications_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"publications_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"publisher","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"year","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"rank","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"file_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"random_facts","indexes":[{"name":"random_facts_created_by_id_fk","columns":["created_by_id"]},{"name":"random_facts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"random_facts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"random_facts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headline","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_fact_true","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"explanation","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"recruiters_pages","indexes":[{"name":"recruiters_pages_created_by_id_fk","columns":["created_by_id"]},{"name":"recruiters_pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"recruiters_pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"recruiters_pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"intro","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"outro","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"schools","indexes":[{"name":"schools_created_by_id_fk","columns":["created_by_id"]},{"name":"schools_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"schools_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"schools_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"school_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"degree_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"degree_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"grade","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"start","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"end","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"skills","indexes":[{"name":"skills_created_by_id_fk","columns":["created_by_id"]},{"name":"skills_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"skills_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"skills_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"rank","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"software_development_intros","indexes":[{"name":"software_development_intros_created_by_id_fk","columns":["created_by_id"]},{"name":"software_development_intros_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"software_development_intros_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"software_development_intros_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"tv_shows","indexes":[{"name":"tv_shows_created_by_id_fk","columns":["created_by_id"]},{"name":"tv_shows_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"tv_shows_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"tv_shows_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"year","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"uses_pages","indexes":[{"name":"uses_pages_created_by_id_fk","columns":["created_by_id"]},{"name":"uses_pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"uses_pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"uses_pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"video_games","indexes":[{"name":"video_games_created_by_id_fk","columns":["created_by_id"]},{"name":"video_games_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"video_games_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"video_games_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"year","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_shared_meta_socials","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"social_network","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_shared_seos","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"meta_title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"keywords","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_robots","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"structured_data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_viewport","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"canonical_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_shared_titled_paragraphs","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"outro","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"admin_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]},{"name":"admin_users_roles_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_links_order_fk","columns":["role_order"]},{"name":"admin_users_roles_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_links","indexes":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_links_unique","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_links_order_inv_fk","columns":["api_token_permission_order"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_links","indexes":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_links_unique","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_links_order_inv_fk","columns":["transfer_token_permission_order"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]},{"name":"files_related_morphs_order_index","columns":["order"]},{"name":"files_related_morphs_id_column_index","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_links","indexes":[{"name":"files_folder_links_fk","columns":["file_id"]},{"name":"files_folder_links_inv_fk","columns":["folder_id"]},{"name":"files_folder_links_unique","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_links_order_inv_fk","columns":["file_order"]}],"foreignKeys":[{"name":"files_folder_links_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_links_inv_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_links","indexes":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"]},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_links_unique","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_links_order_inv_fk","columns":["folder_order"]}],"foreignKeys":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"up_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]},{"name":"up_users_role_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"menu_items_root_menu_links","indexes":[{"name":"menu_items_root_menu_links_fk","columns":["menu_item_id"]},{"name":"menu_items_root_menu_links_inv_fk","columns":["menu_id"]},{"name":"menu_items_root_menu_links_unique","columns":["menu_item_id","menu_id"],"type":"unique"},{"name":"menu_items_root_menu_links_order_inv_fk","columns":["menu_item_order"]}],"foreignKeys":[{"name":"menu_items_root_menu_links_fk","columns":["menu_item_id"],"referencedColumns":["id"],"referencedTable":"menu_items","onDelete":"CASCADE"},{"name":"menu_items_root_menu_links_inv_fk","columns":["menu_id"],"referencedColumns":["id"],"referencedTable":"menus","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"menu_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"menu_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"menu_item_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"menu_items_parent_links","indexes":[{"name":"menu_items_parent_links_fk","columns":["menu_item_id"]},{"name":"menu_items_parent_links_inv_fk","columns":["inv_menu_item_id"]},{"name":"menu_items_parent_links_unique","columns":["menu_item_id","inv_menu_item_id"],"type":"unique"}],"foreignKeys":[{"name":"menu_items_parent_links_fk","columns":["menu_item_id"],"referencedColumns":["id"],"referencedTable":"menu_items","onDelete":"CASCADE"},{"name":"menu_items_parent_links_inv_fk","columns":["inv_menu_item_id"],"referencedColumns":["id"],"referencedTable":"menu_items","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"menu_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_menu_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"books_localizations_links","indexes":[{"name":"books_localizations_links_fk","columns":["book_id"]},{"name":"books_localizations_links_inv_fk","columns":["inv_book_id"]},{"name":"books_localizations_links_unique","columns":["book_id","inv_book_id"],"type":"unique"},{"name":"books_localizations_links_order_fk","columns":["book_order"]}],"foreignKeys":[{"name":"books_localizations_links_fk","columns":["book_id"],"referencedColumns":["id"],"referencedTable":"books","onDelete":"CASCADE"},{"name":"books_localizations_links_inv_fk","columns":["inv_book_id"],"referencedColumns":["id"],"referencedTable":"books","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"book_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_book_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"book_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"home_pages_localizations_links","indexes":[{"name":"home_pages_localizations_links_fk","columns":["home_page_id"]},{"name":"home_pages_localizations_links_inv_fk","columns":["inv_home_page_id"]},{"name":"home_pages_localizations_links_unique","columns":["home_page_id","inv_home_page_id"],"type":"unique"},{"name":"home_pages_localizations_links_order_fk","columns":["home_page_order"]}],"foreignKeys":[{"name":"home_pages_localizations_links_fk","columns":["home_page_id"],"referencedColumns":["id"],"referencedTable":"home_pages","onDelete":"CASCADE"},{"name":"home_pages_localizations_links_inv_fk","columns":["inv_home_page_id"],"referencedColumns":["id"],"referencedTable":"home_pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"home_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_home_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"home_page_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"jobs_localizations_links","indexes":[{"name":"jobs_localizations_links_fk","columns":["job_id"]},{"name":"jobs_localizations_links_inv_fk","columns":["inv_job_id"]},{"name":"jobs_localizations_links_unique","columns":["job_id","inv_job_id"],"type":"unique"},{"name":"jobs_localizations_links_order_fk","columns":["job_order"]}],"foreignKeys":[{"name":"jobs_localizations_links_fk","columns":["job_id"],"referencedColumns":["id"],"referencedTable":"jobs","onDelete":"CASCADE"},{"name":"jobs_localizations_links_inv_fk","columns":["inv_job_id"],"referencedColumns":["id"],"referencedTable":"jobs","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"job_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_job_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"job_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"languages_localizations_links","indexes":[{"name":"languages_localizations_links_fk","columns":["language_id"]},{"name":"languages_localizations_links_inv_fk","columns":["inv_language_id"]},{"name":"languages_localizations_links_unique","columns":["language_id","inv_language_id"],"type":"unique"},{"name":"languages_localizations_links_order_fk","columns":["language_order"]}],"foreignKeys":[{"name":"languages_localizations_links_fk","columns":["language_id"],"referencedColumns":["id"],"referencedTable":"languages","onDelete":"CASCADE"},{"name":"languages_localizations_links_inv_fk","columns":["inv_language_id"],"referencedColumns":["id"],"referencedTable":"languages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"language_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_language_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"language_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"projects_localizations_links","indexes":[{"name":"projects_localizations_links_fk","columns":["project_id"]},{"name":"projects_localizations_links_inv_fk","columns":["inv_project_id"]},{"name":"projects_localizations_links_unique","columns":["project_id","inv_project_id"],"type":"unique"},{"name":"projects_localizations_links_order_fk","columns":["project_order"]}],"foreignKeys":[{"name":"projects_localizations_links_fk","columns":["project_id"],"referencedColumns":["id"],"referencedTable":"projects","onDelete":"CASCADE"},{"name":"projects_localizations_links_inv_fk","columns":["inv_project_id"],"referencedColumns":["id"],"referencedTable":"projects","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"project_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_project_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"project_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"publications_localizations_links","indexes":[{"name":"publications_localizations_links_fk","columns":["publication_id"]},{"name":"publications_localizations_links_inv_fk","columns":["inv_publication_id"]},{"name":"publications_localizations_links_unique","columns":["publication_id","inv_publication_id"],"type":"unique"},{"name":"publications_localizations_links_order_fk","columns":["publication_order"]}],"foreignKeys":[{"name":"publications_localizations_links_fk","columns":["publication_id"],"referencedColumns":["id"],"referencedTable":"publications","onDelete":"CASCADE"},{"name":"publications_localizations_links_inv_fk","columns":["inv_publication_id"],"referencedColumns":["id"],"referencedTable":"publications","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"publication_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_publication_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"publication_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"random_facts_localizations_links","indexes":[{"name":"random_facts_localizations_links_fk","columns":["random_fact_id"]},{"name":"random_facts_localizations_links_inv_fk","columns":["inv_random_fact_id"]},{"name":"random_facts_localizations_links_unique","columns":["random_fact_id","inv_random_fact_id"],"type":"unique"},{"name":"random_facts_localizations_links_order_fk","columns":["random_fact_order"]}],"foreignKeys":[{"name":"random_facts_localizations_links_fk","columns":["random_fact_id"],"referencedColumns":["id"],"referencedTable":"random_facts","onDelete":"CASCADE"},{"name":"random_facts_localizations_links_inv_fk","columns":["inv_random_fact_id"],"referencedColumns":["id"],"referencedTable":"random_facts","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"random_fact_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_random_fact_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"random_fact_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"recruiters_pages_components","indexes":[{"name":"recruiters_pages_field_index","columns":["field"]},{"name":"recruiters_pages_component_type_index","columns":["component_type"]},{"name":"recruiters_pages_entity_fk","columns":["entity_id"]},{"name":"recruiters_pages_unique","columns":["entity_id","component_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"recruiters_pages_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"recruiters_pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"recruiters_pages_localizations_links","indexes":[{"name":"recruiters_pages_localizations_links_fk","columns":["recruiters_page_id"]},{"name":"recruiters_pages_localizations_links_inv_fk","columns":["inv_recruiters_page_id"]},{"name":"recruiters_pages_localizations_links_unique","columns":["recruiters_page_id","inv_recruiters_page_id"],"type":"unique"},{"name":"recruiters_pages_localizations_links_order_fk","columns":["recruiters_page_order"]}],"foreignKeys":[{"name":"recruiters_pages_localizations_links_fk","columns":["recruiters_page_id"],"referencedColumns":["id"],"referencedTable":"recruiters_pages","onDelete":"CASCADE"},{"name":"recruiters_pages_localizations_links_inv_fk","columns":["inv_recruiters_page_id"],"referencedColumns":["id"],"referencedTable":"recruiters_pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"recruiters_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_recruiters_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"recruiters_page_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"schools_localizations_links","indexes":[{"name":"schools_localizations_links_fk","columns":["school_id"]},{"name":"schools_localizations_links_inv_fk","columns":["inv_school_id"]},{"name":"schools_localizations_links_unique","columns":["school_id","inv_school_id"],"type":"unique"},{"name":"schools_localizations_links_order_fk","columns":["school_order"]}],"foreignKeys":[{"name":"schools_localizations_links_fk","columns":["school_id"],"referencedColumns":["id"],"referencedTable":"schools","onDelete":"CASCADE"},{"name":"schools_localizations_links_inv_fk","columns":["inv_school_id"],"referencedColumns":["id"],"referencedTable":"schools","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"school_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_school_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"school_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"skills_localizations_links","indexes":[{"name":"skills_localizations_links_fk","columns":["skill_id"]},{"name":"skills_localizations_links_inv_fk","columns":["inv_skill_id"]},{"name":"skills_localizations_links_unique","columns":["skill_id","inv_skill_id"],"type":"unique"},{"name":"skills_localizations_links_order_fk","columns":["skill_order"]}],"foreignKeys":[{"name":"skills_localizations_links_fk","columns":["skill_id"],"referencedColumns":["id"],"referencedTable":"skills","onDelete":"CASCADE"},{"name":"skills_localizations_links_inv_fk","columns":["inv_skill_id"],"referencedColumns":["id"],"referencedTable":"skills","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"skill_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_skill_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"skill_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"software_development_intros_localizations_links","indexes":[{"name":"software_development_intros_localizations_links_fk","columns":["software_development_intro_id"]},{"name":"software_development_intros_localizations_links_inv_fk","columns":["inv_software_development_intro_id"]},{"name":"software_development_intros_localizations_links_unique","columns":["software_development_intro_id","inv_software_development_intro_id"],"type":"unique"},{"name":"software_development_intros_localizations_links_order_fk","columns":["software_development_intro_order"]}],"foreignKeys":[{"name":"software_development_intros_localizations_links_fk","columns":["software_development_intro_id"],"referencedColumns":["id"],"referencedTable":"software_development_intros","onDelete":"CASCADE"},{"name":"software_development_intros_localizations_links_inv_fk","columns":["inv_software_development_intro_id"],"referencedColumns":["id"],"referencedTable":"software_development_intros","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"software_development_intro_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_software_development_intro_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"software_development_intro_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"uses_pages_components","indexes":[{"name":"uses_pages_field_index","columns":["field"]},{"name":"uses_pages_component_type_index","columns":["component_type"]},{"name":"uses_pages_entity_fk","columns":["entity_id"]},{"name":"uses_pages_unique","columns":["entity_id","component_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"uses_pages_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"uses_pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"uses_pages_localizations_links","indexes":[{"name":"uses_pages_localizations_links_fk","columns":["uses_page_id"]},{"name":"uses_pages_localizations_links_inv_fk","columns":["inv_uses_page_id"]},{"name":"uses_pages_localizations_links_unique","columns":["uses_page_id","inv_uses_page_id"],"type":"unique"},{"name":"uses_pages_localizations_links_order_fk","columns":["uses_page_order"]}],"foreignKeys":[{"name":"uses_pages_localizations_links_fk","columns":["uses_page_id"],"referencedColumns":["id"],"referencedTable":"uses_pages","onDelete":"CASCADE"},{"name":"uses_pages_localizations_links_inv_fk","columns":["inv_uses_page_id"],"referencedColumns":["id"],"referencedTable":"uses_pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"uses_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_uses_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"uses_page_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_shared_seos_components","indexes":[{"name":"components_shared_seos_field_index","columns":["field"]},{"name":"components_shared_seos_component_type_index","columns":["component_type"]},{"name":"components_shared_seos_entity_fk","columns":["entity_id"]},{"name":"components_shared_seos_unique","columns":["entity_id","component_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_shared_seos_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_shared_seos","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}', '2023-11-01 11:08:17.536', '8f818ef9f87fad4a0d5fa73e36208c31');


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
INSERT INTO public.tv_shows (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (12, 'Good Omens', '2019', 'https://www.imdb.com/title/tt1869454', '2023-10-07 20:31:19.258', '2023-10-07 20:31:21.029', '2023-10-07 20:31:21.025', 1, 1);


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
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (33, 'api::home-page.home-page.find', '2023-08-26 13:17:02.915', '2023-08-26 13:17:02.915', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (34, 'api::project.project.find', '2023-09-10 10:58:00.775', '2023-09-10 10:58:00.775', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (35, 'api::project.project.findOne', '2023-09-10 10:58:00.775', '2023-09-10 10:58:00.775', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (37, 'api::recruiters-page.recruiters-page.find', '2023-09-18 18:16:24.662', '2023-09-18 18:16:24.662', NULL, NULL);
INSERT INTO public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) VALUES (38, 'api::uses-page.uses-page.find', '2023-09-26 14:26:07.836', '2023-09-26 14:26:07.836', NULL, NULL);


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
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (33, 33, 2, 10);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (34, 34, 2, 11);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (35, 35, 2, 11);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (37, 37, 2, 12);
INSERT INTO public.up_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (38, 38, 2, 13);


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) VALUES (1, 'Authenticated', 'Default role given to authenticated user.', 'authenticated', '2023-08-13 18:13:24.188', '2023-08-13 18:13:24.188', NULL, NULL);
INSERT INTO public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) VALUES (2, 'Public', 'Default role given to unauthenticated user.', 'public', '2023-08-13 18:13:24.195', '2023-09-26 14:26:07.828', NULL, NULL);


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
INSERT INTO public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) VALUES (6, 'Projects', 6, '/6', '2023-09-13 19:41:03.791', '2023-09-13 19:41:03.791', 1, 1);
INSERT INTO public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) VALUES (7, 'Programming', 7, '/7', '2023-09-13 19:41:42.336', '2023-09-13 19:41:42.336', 1, 1);
INSERT INTO public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) VALUES (8, 'Files', 8, '/8', '2023-09-13 19:42:43.447', '2023-09-13 19:42:43.447', 1, 1);
INSERT INTO public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) VALUES (9, 'Schools & Companies', 9, '/9', '2023-09-13 19:43:34.585', '2023-09-13 19:43:34.585', 1, 1);
INSERT INTO public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) VALUES (10, 'Country Flags', 10, '/10', '2023-09-13 19:43:59.871', '2023-09-13 19:43:59.871', 1, 1);
INSERT INTO public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) VALUES (11, 'Avatar', 11, '/11', '2023-09-14 13:54:03.537', '2023-09-14 13:54:03.537', 1, 1);


--
-- Data for Name: upload_folders_parent_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: uses_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.uses_pages (id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (1, '2023-09-26 14:04:32.814', '2023-11-01 11:49:36.537', '2023-09-27 09:10:04.786', 1, 1, 'en');
INSERT INTO public.uses_pages (id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) VALUES (2, '2023-10-29 10:25:21.872', '2023-11-05 10:50:46.587', '2023-11-05 10:50:46.574', 1, 1, 'en');


--
-- Data for Name: uses_pages_components; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.uses_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (1, 1, 39, 'shared.titled-paragraph', 'hardware', NULL);
INSERT INTO public.uses_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (2, 1, 40, 'shared.titled-paragraph', 'media', NULL);
INSERT INTO public.uses_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (3, 1, 41, 'shared.titled-paragraph', 'programmingTools', NULL);
INSERT INTO public.uses_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (4, 1, 42, 'shared.titled-paragraph', 'security', NULL);
INSERT INTO public.uses_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (5, 1, 43, 'shared.titled-paragraph', 'productivity', NULL);
INSERT INTO public.uses_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (51, 2, 59, 'shared.titled-paragraph', 'hardware', NULL);
INSERT INTO public.uses_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (52, 2, 60, 'shared.titled-paragraph', 'media', NULL);
INSERT INTO public.uses_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (53, 2, 61, 'shared.titled-paragraph', 'programmingTools', NULL);
INSERT INTO public.uses_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (54, 2, 62, 'shared.titled-paragraph', 'security', NULL);
INSERT INTO public.uses_pages_components (id, entity_id, component_id, component_type, field, "order") VALUES (55, 2, 63, 'shared.titled-paragraph', 'productivity', NULL);


--
-- Data for Name: uses_pages_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
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
INSERT INTO public.video_games (id, title, year, link, created_at, updated_at, published_at, created_by_id, updated_by_id) VALUES (17, 'Town of Salem', '2014', 'https://www.igdb.com/games/town-of-salem', '2023-09-20 15:08:37.216', '2023-09-20 15:08:40.167', '2023-09-20 15:08:40.162', 1, 1);


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 375, true);


--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 385, true);


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
-- Name: components_shared_titled_paragraphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_shared_titled_paragraphs_id_seq', 63, true);


--
-- Name: files_folder_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_folder_links_id_seq', 171, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 176, true);


--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 526, true);


--
-- Name: home_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_pages_id_seq', 5, true);


--
-- Name: home_pages_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_pages_localizations_links_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.jobs_id_seq', 7, true);


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

SELECT pg_catalog.setval('public.podcasts_id_seq', 11, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 24, true);


--
-- Name: projects_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_localizations_links_id_seq', 1, false);


--
-- Name: publications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publications_id_seq', 5, true);


--
-- Name: publications_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publications_localizations_links_id_seq', 2, true);


--
-- Name: random_facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.random_facts_id_seq', 11, true);


--
-- Name: random_facts_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.random_facts_localizations_links_id_seq', 1, false);


--
-- Name: recruiters_pages_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recruiters_pages_components_id_seq', 213, true);


--
-- Name: recruiters_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recruiters_pages_id_seq', 6, true);


--
-- Name: recruiters_pages_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recruiters_pages_localizations_links_id_seq', 7, true);


--
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schools_id_seq', 7, true);


--
-- Name: schools_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schools_localizations_links_id_seq', 2, true);


--
-- Name: skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skills_id_seq', 13, true);


--
-- Name: skills_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skills_localizations_links_id_seq', 4, true);


--
-- Name: software_development_intros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.software_development_intros_id_seq', 1, true);


--
-- Name: software_development_intros_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.software_development_intros_localizations_links_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 47, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 34, true);


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

SELECT pg_catalog.setval('public.tv_shows_id_seq', 12, true);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 38, true);


--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 38, true);


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

SELECT pg_catalog.setval('public.upload_folders_id_seq', 11, true);


--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);


--
-- Name: uses_pages_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.uses_pages_components_id_seq', 80, true);


--
-- Name: uses_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.uses_pages_id_seq', 2, true);


--
-- Name: uses_pages_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.uses_pages_localizations_links_id_seq', 1, false);


--
-- Name: video_games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.video_games_id_seq', 17, true);


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
-- Name: components_shared_titled_paragraphs components_shared_titled_paragraphs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_shared_titled_paragraphs
    ADD CONSTRAINT components_shared_titled_paragraphs_pkey PRIMARY KEY (id);


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
-- Name: home_pages_localizations_links home_pages_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages_localizations_links
    ADD CONSTRAINT home_pages_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: home_pages_localizations_links home_pages_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages_localizations_links
    ADD CONSTRAINT home_pages_localizations_links_unique UNIQUE (home_page_id, inv_home_page_id);


--
-- Name: home_pages home_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages
    ADD CONSTRAINT home_pages_pkey PRIMARY KEY (id);


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
-- Name: projects_localizations_links projects_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_localizations_links
    ADD CONSTRAINT projects_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: projects_localizations_links projects_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_localizations_links
    ADD CONSTRAINT projects_localizations_links_unique UNIQUE (project_id, inv_project_id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


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
-- Name: recruiters_pages_components recruiters_pages_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruiters_pages_components
    ADD CONSTRAINT recruiters_pages_components_pkey PRIMARY KEY (id);


--
-- Name: recruiters_pages_localizations_links recruiters_pages_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruiters_pages_localizations_links
    ADD CONSTRAINT recruiters_pages_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: recruiters_pages_localizations_links recruiters_pages_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruiters_pages_localizations_links
    ADD CONSTRAINT recruiters_pages_localizations_links_unique UNIQUE (recruiters_page_id, inv_recruiters_page_id);


--
-- Name: recruiters_pages recruiters_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruiters_pages
    ADD CONSTRAINT recruiters_pages_pkey PRIMARY KEY (id);


--
-- Name: recruiters_pages_components recruiters_pages_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruiters_pages_components
    ADD CONSTRAINT recruiters_pages_unique UNIQUE (entity_id, component_id, field, component_type);


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
-- Name: uses_pages_components uses_pages_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_pages_components
    ADD CONSTRAINT uses_pages_components_pkey PRIMARY KEY (id);


--
-- Name: uses_pages_localizations_links uses_pages_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_pages_localizations_links
    ADD CONSTRAINT uses_pages_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: uses_pages_localizations_links uses_pages_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_pages_localizations_links
    ADD CONSTRAINT uses_pages_localizations_links_unique UNIQUE (uses_page_id, inv_uses_page_id);


--
-- Name: uses_pages uses_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_pages
    ADD CONSTRAINT uses_pages_pkey PRIMARY KEY (id);


--
-- Name: uses_pages_components uses_pages_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_pages_components
    ADD CONSTRAINT uses_pages_unique UNIQUE (entity_id, component_id, field, component_type);


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
-- Name: home_pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX home_pages_created_by_id_fk ON public.home_pages USING btree (created_by_id);


--
-- Name: home_pages_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX home_pages_localizations_links_fk ON public.home_pages_localizations_links USING btree (home_page_id);


--
-- Name: home_pages_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX home_pages_localizations_links_inv_fk ON public.home_pages_localizations_links USING btree (inv_home_page_id);


--
-- Name: home_pages_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX home_pages_localizations_links_order_fk ON public.home_pages_localizations_links USING btree (home_page_order);


--
-- Name: home_pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX home_pages_updated_by_id_fk ON public.home_pages USING btree (updated_by_id);


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
-- Name: projects_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_created_by_id_fk ON public.projects USING btree (created_by_id);


--
-- Name: projects_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_localizations_links_fk ON public.projects_localizations_links USING btree (project_id);


--
-- Name: projects_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_localizations_links_inv_fk ON public.projects_localizations_links USING btree (inv_project_id);


--
-- Name: projects_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_localizations_links_order_fk ON public.projects_localizations_links USING btree (project_order);


--
-- Name: projects_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_updated_by_id_fk ON public.projects USING btree (updated_by_id);


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
-- Name: recruiters_pages_component_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recruiters_pages_component_type_index ON public.recruiters_pages_components USING btree (component_type);


--
-- Name: recruiters_pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recruiters_pages_created_by_id_fk ON public.recruiters_pages USING btree (created_by_id);


--
-- Name: recruiters_pages_entity_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recruiters_pages_entity_fk ON public.recruiters_pages_components USING btree (entity_id);


--
-- Name: recruiters_pages_field_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recruiters_pages_field_index ON public.recruiters_pages_components USING btree (field);


--
-- Name: recruiters_pages_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recruiters_pages_localizations_links_fk ON public.recruiters_pages_localizations_links USING btree (recruiters_page_id);


--
-- Name: recruiters_pages_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recruiters_pages_localizations_links_inv_fk ON public.recruiters_pages_localizations_links USING btree (inv_recruiters_page_id);


--
-- Name: recruiters_pages_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recruiters_pages_localizations_links_order_fk ON public.recruiters_pages_localizations_links USING btree (recruiters_page_order);


--
-- Name: recruiters_pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recruiters_pages_updated_by_id_fk ON public.recruiters_pages USING btree (updated_by_id);


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
-- Name: uses_pages_component_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX uses_pages_component_type_index ON public.uses_pages_components USING btree (component_type);


--
-- Name: uses_pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX uses_pages_created_by_id_fk ON public.uses_pages USING btree (created_by_id);


--
-- Name: uses_pages_entity_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX uses_pages_entity_fk ON public.uses_pages_components USING btree (entity_id);


--
-- Name: uses_pages_field_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX uses_pages_field_index ON public.uses_pages_components USING btree (field);


--
-- Name: uses_pages_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX uses_pages_localizations_links_fk ON public.uses_pages_localizations_links USING btree (uses_page_id);


--
-- Name: uses_pages_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX uses_pages_localizations_links_inv_fk ON public.uses_pages_localizations_links USING btree (inv_uses_page_id);


--
-- Name: uses_pages_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX uses_pages_localizations_links_order_fk ON public.uses_pages_localizations_links USING btree (uses_page_order);


--
-- Name: uses_pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX uses_pages_updated_by_id_fk ON public.uses_pages USING btree (updated_by_id);


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
-- Name: home_pages home_pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages
    ADD CONSTRAINT home_pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: home_pages_localizations_links home_pages_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages_localizations_links
    ADD CONSTRAINT home_pages_localizations_links_fk FOREIGN KEY (home_page_id) REFERENCES public.home_pages(id) ON DELETE CASCADE;


--
-- Name: home_pages_localizations_links home_pages_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages_localizations_links
    ADD CONSTRAINT home_pages_localizations_links_inv_fk FOREIGN KEY (inv_home_page_id) REFERENCES public.home_pages(id) ON DELETE CASCADE;


--
-- Name: home_pages home_pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages
    ADD CONSTRAINT home_pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


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
-- Name: projects projects_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: projects_localizations_links projects_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_localizations_links
    ADD CONSTRAINT projects_localizations_links_fk FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: projects_localizations_links projects_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_localizations_links
    ADD CONSTRAINT projects_localizations_links_inv_fk FOREIGN KEY (inv_project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: projects projects_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


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
-- Name: recruiters_pages recruiters_pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruiters_pages
    ADD CONSTRAINT recruiters_pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: recruiters_pages_components recruiters_pages_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruiters_pages_components
    ADD CONSTRAINT recruiters_pages_entity_fk FOREIGN KEY (entity_id) REFERENCES public.recruiters_pages(id) ON DELETE CASCADE;


--
-- Name: recruiters_pages_localizations_links recruiters_pages_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruiters_pages_localizations_links
    ADD CONSTRAINT recruiters_pages_localizations_links_fk FOREIGN KEY (recruiters_page_id) REFERENCES public.recruiters_pages(id) ON DELETE CASCADE;


--
-- Name: recruiters_pages_localizations_links recruiters_pages_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruiters_pages_localizations_links
    ADD CONSTRAINT recruiters_pages_localizations_links_inv_fk FOREIGN KEY (inv_recruiters_page_id) REFERENCES public.recruiters_pages(id) ON DELETE CASCADE;


--
-- Name: recruiters_pages recruiters_pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruiters_pages
    ADD CONSTRAINT recruiters_pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


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
-- Name: uses_pages uses_pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_pages
    ADD CONSTRAINT uses_pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: uses_pages_components uses_pages_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_pages_components
    ADD CONSTRAINT uses_pages_entity_fk FOREIGN KEY (entity_id) REFERENCES public.uses_pages(id) ON DELETE CASCADE;


--
-- Name: uses_pages_localizations_links uses_pages_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_pages_localizations_links
    ADD CONSTRAINT uses_pages_localizations_links_fk FOREIGN KEY (uses_page_id) REFERENCES public.uses_pages(id) ON DELETE CASCADE;


--
-- Name: uses_pages_localizations_links uses_pages_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_pages_localizations_links
    ADD CONSTRAINT uses_pages_localizations_links_inv_fk FOREIGN KEY (inv_uses_page_id) REFERENCES public.uses_pages(id) ON DELETE CASCADE;


--
-- Name: uses_pages uses_pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_pages
    ADD CONSTRAINT uses_pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


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

