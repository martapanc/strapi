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
-- Name: components_shared_titled_paragraphs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_shared_titled_paragraphs (
    id integer NOT NULL,
    title character varying(255),
    content text
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
    vuid character varying(255),
    version_number integer,
    version_comment character varying(255),
    is_visible_in_list_view boolean,
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
-- Name: home_pages_versions_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_pages_versions_links (
    id integer NOT NULL,
    home_page_id integer,
    inv_home_page_id integer,
    home_page_order double precision
);


ALTER TABLE public.home_pages_versions_links OWNER TO postgres;

--
-- Name: home_pages_versions_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_pages_versions_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_pages_versions_links_id_seq OWNER TO postgres;

--
-- Name: home_pages_versions_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_pages_versions_links_id_seq OWNED BY public.home_pages_versions_links.id;


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
    vuid character varying(255),
    version_number integer,
    version_comment character varying(255),
    is_visible_in_list_view boolean,
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
-- Name: projects_versions_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_versions_links (
    id integer NOT NULL,
    project_id integer,
    inv_project_id integer,
    project_order double precision
);


ALTER TABLE public.projects_versions_links OWNER TO postgres;

--
-- Name: projects_versions_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_versions_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_versions_links_id_seq OWNER TO postgres;

--
-- Name: projects_versions_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_versions_links_id_seq OWNED BY public.projects_versions_links.id;


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
-- Name: recruiters_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recruiters_pages (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    vuid character varying(255),
    version_number integer,
    version_comment character varying(255),
    is_visible_in_list_view boolean,
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
-- Name: recruiters_pages_versions_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recruiters_pages_versions_links (
    id integer NOT NULL,
    recruiters_page_id integer,
    inv_recruiters_page_id integer,
    recruiters_page_order double precision
);


ALTER TABLE public.recruiters_pages_versions_links OWNER TO postgres;

--
-- Name: recruiters_pages_versions_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recruiters_pages_versions_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recruiters_pages_versions_links_id_seq OWNER TO postgres;

--
-- Name: recruiters_pages_versions_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recruiters_pages_versions_links_id_seq OWNED BY public.recruiters_pages_versions_links.id;


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
-- Name: uses_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uses_pages (
    id integer NOT NULL,
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
-- Name: uses_pages_versions_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uses_pages_versions_links (
    id integer NOT NULL,
    uses_page_id integer,
    inv_uses_page_id integer,
    uses_page_order double precision
);


ALTER TABLE public.uses_pages_versions_links OWNER TO postgres;

--
-- Name: uses_pages_versions_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.uses_pages_versions_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uses_pages_versions_links_id_seq OWNER TO postgres;

--
-- Name: uses_pages_versions_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uses_pages_versions_links_id_seq OWNED BY public.uses_pages_versions_links.id;


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
-- Name: home_pages_versions_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_pages_versions_links ALTER COLUMN id SET DEFAULT nextval('public.home_pages_versions_links_id_seq'::regclass);


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
-- Name: projects_versions_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_versions_links ALTER COLUMN id SET DEFAULT nextval('public.projects_versions_links_id_seq'::regclass);


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
-- Name: recruiters_pages_versions_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruiters_pages_versions_links ALTER COLUMN id SET DEFAULT nextval('public.recruiters_pages_versions_links_id_seq'::regclass);


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
-- Name: uses_pages_versions_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uses_pages_versions_links ALTER COLUMN id SET DEFAULT nextval('public.uses_pages_versions_links_id_seq'::regclass);


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
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (177, 'plugin::content-manager.explorer.delete', 'api::home-page.home-page', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-26 13:16:17.185', '2023-08-26 13:16:17.185', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (178, 'plugin::content-manager.explorer.publish', 'api::home-page.home-page', '{"locales": ["en", "de", "it"]}', '[]', '2023-08-26 13:16:17.194', '2023-08-26 13:16:17.194', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (179, 'plugin::content-manager.explorer.create', 'api::home-page.home-page', '{"fields": ["greeting", "introduction_1", "introduction_2", "introduction_3", "introduction_4", "introduction_5"], "locales": ["en", "de", "it"]}', '[]', '2023-08-30 15:39:10.003', '2023-08-30 15:39:10.003', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (180, 'plugin::content-manager.explorer.read', 'api::home-page.home-page', '{"fields": ["greeting", "introduction_1", "introduction_2", "introduction_3", "introduction_4", "introduction_5"], "locales": ["en", "de", "it"]}', '[]', '2023-08-30 15:39:10.015', '2023-08-30 15:39:10.015', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (181, 'plugin::content-manager.explorer.update', 'api::home-page.home-page', '{"fields": ["greeting", "introduction_1", "introduction_2", "introduction_3", "introduction_4", "introduction_5"], "locales": ["en", "de", "it"]}', '[]', '2023-08-30 15:39:10.024', '2023-08-30 15:39:10.024', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (185, 'plugin::content-manager.explorer.delete', 'api::project.project', '{"locales": ["en", "de", "it"]}', '[]', '2023-09-10 10:13:50.393', '2023-09-10 10:13:50.393', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (186, 'plugin::content-manager.explorer.publish', 'api::project.project', '{"locales": ["en", "de", "it"]}', '[]', '2023-09-10 10:13:50.401', '2023-09-10 10:13:50.401', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (187, 'plugin::content-manager.explorer.create', 'api::project.project', '{"fields": ["title", "image", "shortDescription", "tools", "date", "tags", "links", "longDescription"], "locales": ["en", "de", "it"]}', '[]', '2023-09-10 10:49:36.961', '2023-09-10 10:49:36.961', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (188, 'plugin::content-manager.explorer.read', 'api::project.project', '{"fields": ["title", "image", "shortDescription", "tools", "date", "tags", "links", "longDescription"], "locales": ["en", "de", "it"]}', '[]', '2023-09-10 10:49:36.972', '2023-09-10 10:49:36.972', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (189, 'plugin::content-manager.explorer.update', 'api::project.project', '{"fields": ["title", "image", "shortDescription", "tools", "date", "tags", "links", "longDescription"], "locales": ["en", "de", "it"]}', '[]', '2023-09-10 10:49:36.98', '2023-09-10 10:49:36.98', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (193, 'plugin::content-manager.explorer.delete', 'api::recruiters-page.recruiters-page', '{"locales": ["en", "de", "it"]}', '[]', '2023-09-18 17:43:39.728', '2023-09-18 17:43:39.728', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (194, 'plugin::content-manager.explorer.publish', 'api::recruiters-page.recruiters-page', '{"locales": ["en", "de", "it"]}', '[]', '2023-09-18 17:43:39.739', '2023-09-18 17:43:39.739', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (210, 'plugin::content-manager.explorer.create', 'api::recruiters-page.recruiters-page', '{"fields": ["jobPreferences.title", "jobPreferences.content", "tldr.title", "tldr.content", "salary.title", "salary.content", "toolsTechs.title", "toolsTechs.content", "generalInfo.title", "generalInfo.content", "intro", "outro"], "locales": ["en", "de", "it"]}', '[]', '2023-09-19 17:24:34.028', '2023-09-19 17:24:34.028', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (211, 'plugin::content-manager.explorer.read', 'api::recruiters-page.recruiters-page', '{"fields": ["jobPreferences.title", "jobPreferences.content", "tldr.title", "tldr.content", "salary.title", "salary.content", "toolsTechs.title", "toolsTechs.content", "generalInfo.title", "generalInfo.content", "intro", "outro"], "locales": ["en", "de", "it"]}', '[]', '2023-09-19 17:24:34.04', '2023-09-19 17:24:34.04', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (212, 'plugin::content-manager.explorer.update', 'api::recruiters-page.recruiters-page', '{"fields": ["jobPreferences.title", "jobPreferences.content", "tldr.title", "tldr.content", "salary.title", "salary.content", "toolsTechs.title", "toolsTechs.content", "generalInfo.title", "generalInfo.content", "intro", "outro"], "locales": ["en", "de", "it"]}', '[]', '2023-09-19 17:24:34.05', '2023-09-19 17:24:34.05', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (216, 'plugin::content-manager.explorer.delete', 'api::uses-page.uses-page', '{"locales": ["en", "de", "it"]}', '[]', '2023-09-23 16:33:12.262', '2023-09-23 16:33:12.262', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (217, 'plugin::content-manager.explorer.publish', 'api::uses-page.uses-page', '{"locales": ["en", "de", "it"]}', '[]', '2023-09-23 16:33:12.271', '2023-09-23 16:33:12.271', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (218, 'plugin::content-manager.explorer.create', 'api::uses-page.uses-page', '{"fields": ["hardware.title", "hardware.content", "media.title", "media.content", "programmingTools.title", "programmingTools.content", "security.title", "security.content", "productivity.title", "productivity.content"], "locales": ["en", "de", "it"]}', '[]', '2023-09-26 13:55:26.967', '2023-09-26 13:55:26.967', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (219, 'plugin::content-manager.explorer.read', 'api::uses-page.uses-page', '{"fields": ["hardware.title", "hardware.content", "media.title", "media.content", "programmingTools.title", "programmingTools.content", "security.title", "security.content", "productivity.title", "productivity.content"], "locales": ["en", "de", "it"]}', '[]', '2023-09-26 13:55:26.979', '2023-09-26 13:55:26.979', NULL, NULL);
INSERT INTO public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) VALUES (220, 'plugin::content-manager.explorer.update', 'api::uses-page.uses-page', '{"fields": ["hardware.title", "hardware.content", "media.title", "media.content", "programmingTools.title", "programmingTools.content", "security.title", "security.content", "productivity.title", "productivity.content"], "locales": ["en", "de", "it"]}', '[]', '2023-09-26 13:55:26.988', '2023-09-26 13:55:26.988', NULL, NULL);


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
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (187, 177, 1, 156);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (188, 178, 1, 157);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (189, 179, 1, 158);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (190, 180, 1, 159);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (191, 181, 1, 160);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (195, 185, 1, 164);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (196, 186, 1, 165);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (197, 187, 1, 166);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (198, 188, 1, 167);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (199, 189, 1, 168);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (203, 193, 1, 172);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (204, 194, 1, 173);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (220, 210, 1, 174);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (221, 211, 1, 175);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (222, 212, 1, 176);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (226, 216, 1, 180);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (227, 217, 1, 181);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (228, 218, 1, 182);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (229, 219, 1, 183);
INSERT INTO public.admin_permissions_role_links (id, permission_id, role_id, permission_order) VALUES (230, 220, 1, 184);


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
-- Data for Name: components_shared_titled_paragraphs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (1, 'Job Preferences', '- **Fully remote only**.
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

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (34, 'TL;DR', '🏡 Remote-first position. (Infrequent visits to the office, say 1-2 per quarter, are fine.)

🇮🇹 Italian resident employment. (Preferably in EMEA to align with timezones, but willing to consider any location. Additionally, I have the right to work in the UK thanks to my "Settled Status".)

🖋️ Permanent or Contract.

⚙️ Ideally full-stack or backend-focused.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (35, 'Setting the Stage: Salary Expectations', 'Let''s talk money, shall we? While it''s not the job search holy grail, it does matter. As much as I''d love to pay my bills with passion and dedication, unfortunately that''s not how the world works 😉💰

I get to the point: if the salary doesn''t align, I respectfully move on. It''s all about clarity, respect, and efficiency 😊👍💼

I came up with this fun little tool to help you get a sense of what I''m aiming for in my next role. The numbers aren''t etched in stone, but it''s a cool way to kick things off 🎉');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (36, 'Tools & Technologies', '#### 🟢  Preferred technologies: \*

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

\* have a look at my [cv](/cv) and [projects](/projects) pages to get a better idea of the work experience I have had and the projects I have been involved in.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (14, 'Job Preferences', '**Fully remote only**.

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

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (10, 'Job Preferences', '**Fully remote only**.

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

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (11, 'Job Preferences', '**Fully remote only**.

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

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (12, 'Job Preferences', '**Fully remote only**.

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

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (13, 'Job Preferences', '**Fully remote only**.

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

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (15, 'Job Preferences', '**Fully remote only**.

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

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (16, 'TL;DR', '- 🏡 Remote-first position. (Infrequent visits to the office, say 1-2 per quarter, are fine.)
- 🇮🇹 Italian resident employment. (Preferably in EMEA to align with timezones, but willing to consider any location. Additionally, I have the right to work in the UK thanks to my "Settled Status".)
- 🖋️ Permanent or Contract.
- ⚙️ Ideally full-stack or backend-focused.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (17, 'Job Preferences', '**Fully remote only**.

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

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (18, 'TL;DR', '- 🏡 Remote-first position. (Infrequent visits to the office, say 1-2 per quarter, are fine.)
- 🇮🇹 Italian resident employment. (Preferably in EMEA to align with timezones, but willing to consider any location. Additionally, I have the right to work in the UK thanks to my "Settled Status".)
- 🖋️ Permanent or Contract.
- ⚙️ Ideally full-stack or backend-focused.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (19, 'Setting the Stage: Salary Expectations', 'Let''s talk money, shall we? While it''s not the job search holy grail, it does matter. As much as I''d love to pay my bills with passion, that''s not how the world works 😉💰

I get to the point: if the salary doesn''t align, I respectfully move on. It''s all about clarity, respect, and efficiency 😊👍💼

I came up with this fun little tool to help you get a sense of what I''m aiming for in my next role. The numbers aren''t etched in stone, but it''s a cool way to kick things off 🎉');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (23, 'Job Preferences', '**Fully remote only**.

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

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (24, 'TL;DR', '- 🏡 Remote-first position. (Infrequent visits to the office, say 1-2 per quarter, are fine.)
- 🇮🇹 Italian resident employment. (Preferably in EMEA to align with timezones, but willing to consider any location. Additionally, I have the right to work in the UK thanks to my "Settled Status".)
- 🖋️ Permanent or Contract.
- ⚙️ Ideally full-stack or backend-focused.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (25, 'Setting the Stage: Salary Expectations', 'Let''s talk money, shall we? While it''s not the job search holy grail, it does matter. As much as I''d love to pay my bills with passion, that''s not how the world works 😉💰

I get to the point: if the salary doesn''t align, I respectfully move on. It''s all about clarity, respect, and efficiency 😊👍💼

I came up with this fun little tool to help you get a sense of what I''m aiming for in my next role. The numbers aren''t etched in stone, but it''s a cool way to kick things off 🎉');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (26, 'Tools & Technologies', '#### 🟢  Preferred technologies: \*

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

\* have a look at my [cv](/cv) and [projects](/projects) pages to get a better idea of the work experience I have had and the projects I have been involved in.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (31, 'Tools & Technologies', '#### 🟢  Preferred technologies: \*

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

\* have a look at my [cv](/cv) and [projects](/projects) pages to get a better idea of the work experience I have had and the projects I have been involved in.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (20, 'Job Preferences', '**Fully remote only**.

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

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (21, 'TL;DR', '- 🏡 Remote-first position. (Infrequent visits to the office, say 1-2 per quarter, are fine.)
- 🇮🇹 Italian resident employment. (Preferably in EMEA to align with timezones, but willing to consider any location. Additionally, I have the right to work in the UK thanks to my "Settled Status".)
- 🖋️ Permanent or Contract.
- ⚙️ Ideally full-stack or backend-focused.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (22, 'Setting the Stage: Salary Expectations', 'Let''s talk money, shall we? While it''s not the job search holy grail, it does matter. As much as I''d love to pay my bills with passion, that''s not how the world works 😉💰

I get to the point: if the salary doesn''t align, I respectfully move on. It''s all about clarity, respect, and efficiency 😊👍💼

I came up with this fun little tool to help you get a sense of what I''m aiming for in my next role. The numbers aren''t etched in stone, but it''s a cool way to kick things off 🎉');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (27, 'Job Preferences', '**Fully remote only**.

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

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (28, 'TL;DR', '- 🏡 Remote-first position. (Infrequent visits to the office, say 1-2 per quarter, are fine.)
- 🇮🇹 Italian resident employment. (Preferably in EMEA to align with timezones, but willing to consider any location. Additionally, I have the right to work in the UK thanks to my "Settled Status".)
- 🖋️ Permanent or Contract.
- ⚙️ Ideally full-stack or backend-focused.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (29, 'Setting the Stage: Salary Expectations', 'Let''s talk money, shall we? While it''s not the job search holy grail, it does matter. As much as I''d love to pay my bills with passion, that''s not how the world works 😉💰

I get to the point: if the salary doesn''t align, I respectfully move on. It''s all about clarity, respect, and efficiency 😊👍💼

I came up with this fun little tool to help you get a sense of what I''m aiming for in my next role. The numbers aren''t etched in stone, but it''s a cool way to kick things off 🎉');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (30, 'Tools & Technologies', '#### 🟢  Preferred technologies: \*

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

\* have a look at my [cv](/cv) and [projects](/projects) pages to get a better idea of the work experience I have had and the projects I have been involved in.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (32, 'Job Preferences', '**Fully remote only**.

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

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (33, 'Job Preferences', '**Fully remote only**.

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

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (38, 'General Info', '#### Roles I’m interested in

- Software Engineer
- Full-stack developer
- Backend developer

#### Seniority

- 5+ years of work experience
- Mid to Senior level');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (41, '🛠️ Programming Tools', 'IntelliJ IDEA

Visual Studio Code

iTerm terminal

Postman');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (42, '🔐 Security', '**Bitwarden**: password manager

Nord VPN

**Authy**: 2FA code generator

**Brave**: faster and more privacy-friendly than Chrome');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (43, '🎯 Productivity', 'Notion

Slack

Discord

**Telegram**: do people really still use Whatsapp?

**Microsoft To Do**, basically for organizing my life

**GoodReads** for keeping track of the books I read

**Google Play Books** for syncing ebooks across devices

DeepL

**[XBar](https://xbarapp.com/)**: put anything in my MacOS menu bar

**[Raindrop.io](https://raindrop.io/)** for organizing my (way too many) online bookmarks');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (37, 'Job Preferences', '🏠 **Fully remote only**

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

**Preferred industries**: Academic/Research, Accounting, Consultancy, eCommerce, Fintech, Gaming, Health & Fitness, Retail, Technology, Travel.');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (39, '⚙️ Hardware', '**MacBook Pro 16” 2019** (2.6 GHz 6-core; Intel Core i7; 32 GB RAM; 1 TB Storage) ~ **work laptop** 💼

**MacBook Pro 13" 2018** (2.7 GHz 4-core; Intel Core i7; 16 GB RAM; 256 GB Storage) ~ **personal laptop** 👩🏻‍💻

Apple Magic Mouse

Logitech MX Keys

ASUS VA24DQLB 24" screen

ErGear Dual monitor stand

Bose SoundLink Around-Ear Wireless Headphones II

AirPods Pro

iPad Air 4th gen

**[Supernote A6X](https://supernote.eu/produit/bundle-a6x/)**: e-Ink ebook reader for note taking

New Kindle Paperwhite (2018)

iPhone 13

Synology NAS DS720+

**[AutoFull Ergonomic Gaming Chair](https://autofull.com/)** (Red)');
INSERT INTO public.components_shared_titled_paragraphs (id, title, content) VALUES (40, '🎬 Media', '**Plex** for organizing my movie, tv-series and music library

**Spotify** mainly for podcasts

**Storytel** for audiobooks');


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (5, 'de.svg', NULL, NULL, 512, 512, NULL, 'de_9c5221adfa', '.svg', 'image/svg+xml', 0.68, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692716604/de_9c5221adfa.svg', NULL, 'cloudinary', '{"public_id": "de_9c5221adfa", "resource_type": "image"}', '/10', '2023-08-22 15:03:26.192', '2023-08-22 15:03:26.192', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (6, 'it.svg', NULL, NULL, 512, 512, NULL, 'it_00c57db1fb', '.svg', 'image/svg+xml', 0.80, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692716604/it_00c57db1fb.svg', NULL, 'cloudinary', '{"public_id": "it_00c57db1fb", "resource_type": "image"}', '/10', '2023-08-22 15:03:26.214', '2023-08-22 17:03:09.323', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (7, 'uk.svg', NULL, NULL, 512, 512, NULL, 'uk_657deb6132', '.svg', 'image/svg+xml', 2.27, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692716604/uk_657deb6132.svg', NULL, 'cloudinary', '{"public_id": "uk_657deb6132", "resource_type": "image"}', '/10', '2023-08-22 15:03:26.438', '2023-08-22 15:03:26.438', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (8, 'fr.svg', NULL, NULL, 512, 512, NULL, 'fr_eb256cde21', '.svg', 'image/svg+xml', 0.73, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692716604/fr_eb256cde21.svg', NULL, 'cloudinary', '{"public_id": "fr_eb256cde21", "resource_type": "image"}', '/10', '2023-08-22 15:03:26.463', '2023-08-22 15:03:26.463', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (1, 'Resourcify.png', NULL, NULL, 303, 303, '{"thumbnail": {"ext": ".png", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692123344/thumbnail_Resourcify_32e03a1d59.png", "hash": "thumbnail_Resourcify_32e03a1d59", "mime": "image/png", "name": "thumbnail_Resourcify.png", "path": null, "size": 6.25, "width": 156, "height": 156, "provider_metadata": {"public_id": "thumbnail_Resourcify_32e03a1d59", "resource_type": "image"}}}', 'Resourcify_32e03a1d59', '.png', 'image/png', 3.36, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692123344/Resourcify_32e03a1d59.png', NULL, 'cloudinary', '{"public_id": "Resourcify_32e03a1d59", "resource_type": "image"}', '/9', '2023-08-15 18:15:45.084', '2023-08-17 20:40:20.146', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (22, 'code2.webp', NULL, NULL, 280, 400, '{"thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692798463/thumbnail_code2_64d12c0ada.webp", "hash": "thumbnail_code2_64d12c0ada", "mime": "image/webp", "name": "thumbnail_code2.webp", "path": null, "size": 3.26, "width": 109, "height": 156, "provider_metadata": {"public_id": "thumbnail_code2_64d12c0ada", "resource_type": "image"}}}', 'code2_64d12c0ada', '.webp', 'image/webp', 8.09, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692798463/code2_64d12c0ada.webp', NULL, 'cloudinary', '{"public_id": "code2_64d12c0ada", "resource_type": "image"}', '/1', '2023-08-23 13:47:43.461', '2023-08-23 13:47:43.461', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (21, 'laptop.svg', NULL, NULL, 410, 410, NULL, 'laptop_4a3ba3b30c', '.svg', 'image/svg+xml', 7.10, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692734473/laptop_4a3ba3b30c.svg', NULL, 'cloudinary', '{"public_id": "laptop_4a3ba3b30c", "resource_type": "image"}', '/5', '2023-08-22 20:01:14.08', '2023-08-22 20:01:14.08', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (18, 'python.svg', NULL, NULL, 128, 128, NULL, 'python_bfafede620', '.svg', 'image/svg+xml', 2.17, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692732723/python_bfafede620.svg', NULL, 'cloudinary', '{"public_id": "python_bfafede620", "resource_type": "image"}', '/7', '2023-08-22 19:32:04.52', '2023-08-22 19:32:04.52', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (19, 'java.svg', NULL, NULL, 128, 128, NULL, 'java_485a6e1666', '.svg', 'image/svg+xml', 1.54, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692732723/java_485a6e1666.svg', NULL, 'cloudinary', '{"public_id": "java_485a6e1666", "resource_type": "image"}', '/7', '2023-08-22 19:32:04.636', '2023-08-22 19:32:04.636', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (20, 'hibernate.svg', NULL, NULL, 256, 256, NULL, 'hibernate_4a990cdba3', '.svg', 'image/svg+xml', 3.60, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692732723/hibernate_4a990cdba3.svg', NULL, 'cloudinary', '{"public_id": "hibernate_4a990cdba3", "resource_type": "image"}', '/7', '2023-08-22 19:32:04.714', '2023-08-22 19:32:04.714', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (15, 'IEEE.pdf', NULL, NULL, NULL, NULL, NULL, 'IEEE_cb505789df', '.pdf', 'application/pdf', 754.92, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692731283/IEEE_cb505789df.pdf', NULL, 'cloudinary', '{"public_id": "IEEE_cb505789df", "resource_type": "image"}', '/8', '2023-08-22 19:08:04.463', '2023-08-22 19:08:04.463', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (16, 'comp61511_dissertation.pdf', NULL, NULL, NULL, NULL, NULL, 'comp61511_dissertation_2efa2eaa90', '.pdf', 'application/pdf', 852.63, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692731486/comp61511_dissertation_2efa2eaa90.pdf', NULL, 'cloudinary', '{"public_id": "comp61511_dissertation_2efa2eaa90", "resource_type": "image"}', '/8', '2023-08-22 19:11:26.812', '2023-08-22 19:11:26.812', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (17, 'SATD_Thesis.pdf', NULL, NULL, NULL, NULL, NULL, 'SATD_Thesis_5a590e5a45', '.pdf', 'application/pdf', 1388.43, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692731487/SATD_Thesis_5a590e5a45.pdf', NULL, 'cloudinary', '{"public_id": "SATD_Thesis_5a590e5a45", "resource_type": "image"}', '/8', '2023-08-22 19:11:27.697', '2023-08-22 19:11:27.697', 1, 1);
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (14, 'us.svg', NULL, NULL, 512, 512, NULL, 'us_f39fa66a76', '.svg', 'image/svg+xml', 3.36, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1692724050/us_f39fa66a76.svg', NULL, 'cloudinary', '{"public_id": "us_f39fa66a76", "resource_type": "image"}', '/10', '2023-08-22 17:07:31.494', '2023-08-22 17:07:31.494', 1, 1);
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
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (87, 'bookingcom.svg', NULL, NULL, 2500, 424, NULL, 'bookingcom_91b7aa2e36', '.svg', 'image/svg+xml', 4.63, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1693067075/bookingcom_91b7aa2e36.svg', NULL, 'cloudinary', '{"public_id": "bookingcom_91b7aa2e36", "resource_type": "image"}', '/', '2023-08-26 16:24:36.239', '2023-08-26 16:24:36.239', 1, 1);
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
INSERT INTO public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) VALUES (86, 'resourcify.webp', NULL, NULL, 600, 115, '{"small": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1693067033/small_resourcify_69f3b5b70d.webp", "hash": "small_resourcify_69f3b5b70d", "mime": "image/webp", "name": "small_resourcify.webp", "path": null, "size": 7.78, "width": 500, "height": 96, "provider_metadata": {"public_id": "small_resourcify_69f3b5b70d", "resource_type": "image"}}, "thumbnail": {"ext": ".webp", "url": "https://res.cloudinary.com/dwrurydlt/image/upload/v1693067033/thumbnail_resourcify_69f3b5b70d.webp", "hash": "thumbnail_resourcify_69f3b5b70d", "mime": "image/webp", "name": "thumbnail_resourcify.webp", "path": null, "size": 3.34, "width": 245, "height": 47, "provider_metadata": {"public_id": "thumbnail_resourcify_69f3b5b70d", "resource_type": "image"}}}', 'resourcify_69f3b5b70d', '.webp', 'image/webp', 6.20, 'https://res.cloudinary.com/dwrurydlt/image/upload/v1693067033/resourcify_69f3b5b70d.webp', NULL, 'cloudinary', '{"public_id": "resourcify_69f3b5b70d", "resource_type": "image"}', '/', '2023-08-26 16:23:53.696', '2023-08-26 16:23:53.696', 1, 1);
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
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (72, 15, 8, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (73, 16, 8, NULL);
INSERT INTO public.files_folder_links (id, file_id, folder_id, file_order) VALUES (74, 17, 8, NULL);
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


--
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (7, 1, 2, 'api::job.job', 'Icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (8, 1, 3, 'api::job.job', 'Icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (15, 4, 6, 'api::job.job', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (20, 3, 5, 'api::job.job', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (21, 7, 1, 'api::language.language', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (22, 8, 2, 'api::language.language', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (23, 5, 3, 'api::language.language', 'flag', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (24, 6, 4, 'api::language.language', 'flag', 1);
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
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (105, 89, 3, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (115, 92, 4, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (121, 91, 5, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (123, 90, 7, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (125, 90, 2, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (126, 89, 1, 'api::project.project', 'image', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (127, 93, 10, 'api::podcast.podcast', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (129, 27, 9, 'api::book.book', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (133, 21, 1, 'api::software-development-intro.software-development-intro', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (134, 100, 17, 'api::video-game.video-game', 'cover', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (137, 94, 4, 'api::job.job', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (138, 1, 2, 'api::job.job', 'icon', 1);
INSERT INTO public.files_related_morphs (id, file_id, related_id, related_type, field, "order") VALUES (139, 1, 3, 'api::job.job', 'icon', 1);


--
-- Data for Name: home_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.home_pages (id, greeting, created_at, updated_at, published_at, created_by_id, updated_by_id, vuid, version_number, version_comment, is_visible_in_list_view, locale, introduction_1, introduction_2, introduction_3, introduction_4, introduction_5) VALUES (3, 'Hey there, I''m Marta 👋🏻', '2023-08-30 12:49:45.587', '2023-08-30 12:49:45.587', NULL, 1, 1, '58f965d1-aa9a-4aa3-90cf-ccd11a8803af', 2, NULL, false, 'en', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.home_pages (id, greeting, created_at, updated_at, published_at, created_by_id, updated_by_id, vuid, version_number, version_comment, is_visible_in_list_view, locale, introduction_1, introduction_2, introduction_3, introduction_4, introduction_5) VALUES (2, 'Hey there, I''m Marta 👋🏻', '2023-08-30 12:49:33.677', '2023-08-30 16:57:52.666', '2023-08-30 12:50:15.289', 1, 1, '58f965d1-aa9a-4aa3-90cf-ccd11a8803af', 1, NULL, true, 'en', 'I''m a software engineer based in Turin, Italy, and I am currently working at {Resourcify}.', 'I hold a MSc in Advanced Computer Science from the University of Manchester, and have more than five years of work experience across several companies, including {BJSS} and {Booking}. ', 'My skill set embraces a range of programming languages like Java, Kotlin, Python, C# and TypeScript, as well as frontend frameworks such as React and Angular.
', 'While I have a solid foundation in backend development, my heart truly lies in the realm of full-stack engineering.
', 'In my free time, I’m a fiction writer, an avid bookworm, an oboist and alto singer, and a travel photographer.');
INSERT INTO public.home_pages (id, greeting, created_at, updated_at, published_at, created_by_id, updated_by_id, vuid, version_number, version_comment, is_visible_in_list_view, locale, introduction_1, introduction_2, introduction_3, introduction_4, introduction_5) VALUES (1, 'Hey there, I''m Marta 👋🏻', '2023-08-26 13:17:17.125', '2023-08-30 16:42:04.064', '2023-08-26 13:17:32.549', 1, 1, NULL, 1, NULL, true, 'en', 'I''m a software engineer based in Turin, Italy, and I am currently working at {Resourcify}.', 'I hold a MSc in Advanced Computer Science from the University of Manchester, and have more than 5 years of work experience across several companies, including {BJSS} and {Booking}. ', 'My skill set embraces a range of programming languages, including Java, Kotlin, Python, C# and TypeScript, as well as frontend frameworks such as React and Angular.
', 'While I have a solid foundation in backend development, my heart truly lies in the realm of full-stack engineering.
', 'In my free time, I’m a fiction writer, an avid bookworm, an oboist and alto singer, and a travel photographer.');


--
-- Data for Name: home_pages_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: home_pages_versions_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.home_pages_versions_links (id, home_page_id, inv_home_page_id, home_page_order) VALUES (1, 3, 2, 1);


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
INSERT INTO public.jobs (id, description, title, company_name, location, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, start_date, end_date, is_current_job, main_color, dark_color, technologies) VALUES (4, 'A technology consultancy company that provides work opportunities on standalone projects, using a variety of programming languages and stacks.
- I mainly focused on the maintenance of a client''s eCommerce webapp using Drupal, where I implemented small changes across the entire user journey, from product search to purchase and payment.
- I also took on the responsibility of implementing the new cookie banner on the
client''s EU sites, which involved working on 9 domains, understanding business requirements and translating them into technical solutions, and coordinating with the QA team to verify the banner''s behaviour and ensuring a smooth release process.
- I supported the Platform team as a developer and tester in creating a
containerized version of the application.', 'Software Engineer', 'BJSS', 'Manchester (remote)', '2023-08-21 19:19:11.572', '2023-10-03 19:09:30.4', '2023-09-14 14:14:09.242', 1, 1, 'en', '2020-11-02', '2022-03-01', false, '#1447BA', '#CEDCFA', '["PHP", "Drupal", "Java", "JavaScript", "Angular", "Vue", "Google Tag Manager", "Docker", "Jenkins", "Azure"]');
INSERT INTO public.jobs (id, description, title, company_name, location, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, start_date, end_date, is_current_job, main_color, dark_color, technologies) VALUES (2, 'Full-stack work involving development of greenfield tools and maintenance of legacy components, covering a diverse range of projects and technologies, adapting to new challenges and delivering quality results.
- Started in the Recycler API/Platform Core team, where I honed my skills in building robust and scalable applications.
- Joined the Accounting Squad, taking a leading role in developing an accounting platform for internal and client use. I approached this project with a focus on user experience, performance, and maintainability, resulting in a successful product launch. In close collaboration with the Accounting Ops, I sought feedback to continuously improve the functionality of the platform, ensuring it met their specific needs.
- Scaled the application to serve a growing number of clients and their orders and invoices, and I ensured that the app could handle larger volumes of data with minimal latency, resulting in faster processing and improved overall system performance.', 'Full-Stack Engineer', 'Resourcify', 'Hamburg (remote)', '2023-08-14 16:51:46.424', '2023-10-03 19:09:39.57', '2023-08-14 16:51:48.467', 1, 1, 'en', '2022-03-01', NULL, true, '#156970', '#ABEAEF', '["Java", "SpringBoot", "TypeScript", "Angular", "MySQL", "AWS", "Docker", "Kubernetes"]');
INSERT INTO public.jobs (id, description, title, company_name, location, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, start_date, end_date, is_current_job, main_color, dark_color, technologies) VALUES (5, '- Team rotation every six months: payment page, premium insurance and supplier integrations

- Everyday development follows the Agile principles, in particular the Kanban approach, including activities like pair programming and testing, code reviews, daily stand-ups an retros

- Involved in interviewing students who applied for the Booking.com grad scheme', 'Graduate Software Engineer', 'Booking.com', 'Manchester', '2023-08-21 19:21:48.461', '2023-08-21 19:46:07.374', '2023-08-21 19:21:50.659', 1, 1, 'en', '2018-09-03', '2020-11-30', false, '#043580', '#b6d2fd', '["Java", "SpringBoot", "JavaScript", "React", "NodeJS", "PHP", "MySQL", "Docker", "Kubernetes", "AWS", "GCP"]');
INSERT INTO public.jobs (id, description, title, company_name, location, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, start_date, end_date, is_current_job, main_color, dark_color, technologies) VALUES (3, NULL, 'Sviluppatrice Full-Stack', 'Resourcify', 'Amburgo (remoto)', '2023-08-15 18:16:34.39', '2023-10-03 19:09:39.621', '2023-08-15 18:18:02.537', 1, 1, 'it', '2022-03-01', NULL, true, '#156970', '#ABEAEF', '["Java", "SpringBoot", "TypeScript", "Angular", "MySQL", "AWS", "Docker", "Kubernetes"]');


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


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, vuid, version_number, version_comment, is_visible_in_list_view, locale) VALUES (4, 'mpancaldi.web.app', 'Initial iteration of my personal website using ReactJS', 'Built with ReactJS and later migrated to Typescript, it''s also a chance to play around with my web development skills and experiment with front-end technologies. ', 'react,javascript,typescript,firebase', '2019-01-01', 'web,personal,react,javascript,typescript,firebase', '{"github": "https://github.com/martapanc/react-gh-pages", "publicUrl": "https://mpancaldi.web.app/"}', '2023-09-10 10:30:28.313', '2023-09-10 15:51:20.443', '2023-09-13 08:20:22.045', 1, 1, NULL, 1, NULL, true, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, vuid, version_number, version_comment, is_visible_in_list_view, locale) VALUES (5, 'Cloud computing and GDPR ', 'Research article on the effects of GDPR on Cloud services, published by IEEE in 2018', 'Disclosing personal data for a purpose not known by data subjects is a practice that the 2018 EU **General Data Protection Regulation** (GDPR) is supposed to prevent. This article gives an overview of the major aspects of GDPR related to provision, use, and maintenance of **cloud services and technologies**, with the objective of representing effective guidance for companies during the process of complying with the new laws.

The article was written in collaboration between professors and associates of the faculties of Law and Computer Science of the Free University of Bolzano, and was accepted by IEEE for publication in the Nov/Dec 2018 issue.', 'cloud', '2018-11-01', 'university,gdpr,cloud', '{"article": "https://res.cloudinary.com/dwrurydlt/image/upload/v1692731283/IEEE_cb505789df.pdf", "publicUrl": "https://www.computer.org/csdl/magazine/cd/2018/06/mcd2018060058/17D45XwUAKp"}', '2023-09-10 10:40:32.028', '2023-09-10 16:08:50.326', '2023-09-13 08:20:22.045', 1, 1, NULL, 1, NULL, true, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, vuid, version_number, version_comment, is_visible_in_list_view, locale) VALUES (1, 'All-Star Advent of Code', 'My submissions to all Advent of Code challenges (2015-2022)', 'I''ve been participating actively in the Advent of Code challenges since 2020, and after finishing the 2020 event, I decided to go back and solve all puzzles from the past years. 

I succeeded in a few weeks, and now I''m quite proud of my shiny 400 stars ⭐  — not to mention the huge progress I''ve made with Kotlin, complex algorithms and problem solving in general.', 'java,python,kotlin', '2022-12-31', 'personal,java,kotlin,python', '{"github": "https://github.com/martapanc/Advent-Of-Code"}', '2023-09-10 10:18:00.345', '2023-09-11 12:15:40.086', '2023-09-13 08:20:22.045', 1, 1, NULL, 1, NULL, true, 'en');
INSERT INTO public.projects (id, title, short_description, long_description, tools, date, tags, links, created_at, updated_at, published_at, created_by_id, updated_by_id, vuid, version_number, version_comment, is_visible_in_list_view, locale) VALUES (2, 'Fiscal Code Android app', 'Android application for computing an Italian Fiscal Code via the public algorithm, and verifying a code''s validity', 'I started learning Android development recently and, in order to focus on the features of the mobile world, as well as on practising with Kotlin, I''ve been reusing the Java backend of the Fiscal Code calculator I built in university. 

The app has been downloaded 100000+ times and reached a rating of 4.3 during its lifetime. ', 'java,kotlin,android', '2020-06-01', 'java,kotlin,android,personal', '{"github": "https://github.com/martapanc/ItalianFiscalCodeCalculatorApp"}', '2023-09-10 10:22:46.831', '2023-09-10 21:39:16.263', '2023-09-13 08:20:22.045', 1, 1, NULL, 1, NULL, true, 'en');


--
-- Data for Name: projects_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: projects_versions_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



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
-- Data for Name: recruiters_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.recruiters_pages (id, created_at, updated_at, published_at, created_by_id, updated_by_id, vuid, version_number, version_comment, is_visible_in_list_view, locale, intro, outro) VALUES (3, '2023-09-18 19:45:05.15', '2023-09-28 15:21:43.162', '2023-09-18 19:45:08.143', 1, 1, NULL, 1, NULL, true, 'en', 'Nice to meet you! I appreciate your interest in considering me for your software engineering positions. 

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


--
-- Data for Name: recruiters_pages_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: recruiters_pages_versions_links; Type: TABLE DATA; Schema: public; Owner: postgres
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

INSERT INTO public.software_development_intros (id, title, content, created_at, updated_at, published_at, created_by_id, updated_by_id, vuid, version_number, version_comment, is_visible_in_list_view, locale) VALUES (1, 'Software Development', 'Software development has been not only my profession but also my enduring passion for the past 8 years. Below, I''ve provided a glimpse into my key technical skill sets and the technologies that have become integral to my work. 

Want to find out more about my experience? Feel free 