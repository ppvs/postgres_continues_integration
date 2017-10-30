---- PostgreSQL database dump--
-- Dumped from database version 9.6.3-- Dumped by pg_dump version 10.0
SET statement_timeout = 0;SET lock_timeout = 0;SET idle_in_transaction_session_timeout = 0;SET client_encoding = 'UTF8';SET standard_conforming_strings = on;SET check_function_bodies = false;SET client_min_messages = warning;SET row_security = off;
---- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: ---
CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
---- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: ---
COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
SET search_path = public, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;
---- Name: profile; Type: TABLE; Schema: public; Owner: ---
CREATE TABLE IF NOT EXISTS company (    id serial primary key,    name character varying(128) NOT NULL,    email character varying(128),    is_deleted boolean NOT NULL);
CREATE TABLE IF NOT EXISTS company_employees (    id serial primary key,    company_id integer references company(id) NOT NULL,    profile_id uuid NOT NULL,    role integer NOT NULL);
---- Name: document; Type: TABLE; Schema: public; Owner: ---
CREATE TABLE IF NOT EXISTS document (    id serial primary key,    project_guid uuid,    name text NOT NULL,    created timestamp with time zone NOT NULL,    bim_file character varying(100) NOT NULL,    is_deleted boolean NOT NULL,    status integer NOT NULL,    bim_version character varying(40));
CREATE TABLE IF NOT EXISTS profile_document (    id serial primary key,    profile_id uuid  NOT NULL,    document_id integer references document(id) NOT NULL,    role integer NOT NULL);
CREATE TABLE IF NOT EXISTS profile_work_package (    id serial primary key,    profile_id uuid,    work_package_id integer,    status integer);
---- Name: scenario; Type: TABLE; Schema: public; Owner: ---
CREATE TABLE IF NOT EXISTS scenario (    id serial primary key,    scenario_guid uuid NOT NULL,    name text NOT NULL,    is_activated boolean NOT NULL,    document_id integer references document(id) NOT NULL);
---- Name: tbim_calculation; Type: TABLE; Schema: public; Owner: ---
CREATE TABLE IF NOT EXISTS calculation (    id serial primary key,    name text NOT NULL,    calculation_id integer,    calculation_guid uuid,    average_labor_hours double precision NOT NULL,    labor_cost double precision NOT NULL,    material_cost double precision NOT NULL,    plant_cost double precision NOT NULL,    total_preliminaries_overhead double precision,    total_cost double precision NOT NULL,    total_duration interval NOT NULL,    is_shown boolean NOT NULL,    is_activated boolean NOT NULL,    scenario_id integer references scenario(id) NOT NULL);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS material ( id  serial primary key, name  text);
CREATE TABLE IF NOT EXISTS bim_handle ( id  serial primary key, bim_handle_type text, document_id  integer references document(id));
CREATE TABLE IF NOT EXISTS description ( id  serial primary key, source_type text, source_id text, category text, family  text, element_type text, bim_handle_id integer references bim_handle(id));
CREATE TABLE IF NOT EXISTS raw_data ( id  serial primary key, key  text, storage_type text, double_value double precision, string_value text, integer_value integer);
CREATE TABLE IF NOT EXISTS thermal_data_map ( id  serial primary key, material_id integer references material(id), raw_data_id integer references raw_data(id));
CREATE TABLE IF NOT EXISTS structural_data_map ( id  serial primary key, material_id integer references material(id), raw_data_id integer references raw_data(id));
CREATE TABLE IF NOT EXISTS material_map ( id  serial primary key, bim_handle_id integer references bim_handle(id), material_id integer references material(id));
CREATE TABLE IF NOT EXISTS geometry_item ( id  serial primary key, geometry_type text, data  text, bim_handle_id integer references bim_handle(id));CREATE TABLE IF NOT EXISTS description_data_map ( id  serial primary key, description_id integer references description(id), raw_data_id integer references raw_data(id));
CREATE TABLE IF NOT EXISTS bim_rel ( id  serial primary key, main_id  integer references bim_handle(id), related_id integer references bim_handle(id), bim_rel_type text);---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS element (    id serial primary key,    system_str character varying(20) NOT NULL,    product_str character varying(20) NOT NULL,    status character varying(1) NOT NULL,    product_id integer NOT NULL,    system_id integer NOT NULL);
---- Name: element_uniclass; Type: TABLE; Schema: public; Owner: ---
CREATE TABLE IF NOT EXISTS uniclass (    id serial primary key,    code text NOT NULL,    description text NOT NULL,    "table" text NOT NULL);
---- Name: tbim_constructioncost; Type: TABLE; Schema: public; Owner: ---
CREATE TABLE IF NOT EXISTS construction_cost (    id serial primary key,    quantity double precision,    level_of_nesting integer,    inner_guid uuid,    parent_guid uuid,    duration_per_off_si_unit_hours double precision,    duration text,    name text,    off_si_unit text,    labor_cost double precision,    labor_cost_per_si_unit double precision,    labor_cost_per_off_si_unit double precision,    plant_cost double precision,    plant_cost_per_si_unit double precision,    plant_cost_per_off_si_unit double precision,    material_cost double precision,    material_cost_per_si_unit double precision,    material_cost_per_off_si_unit double precision,    direct_cost_per_si_unit double precision,    direct_cost_per_off_si_unit double precision,    direct_cost double precision,    extra_payments_percentage double precision,    total_cost double precision,    calculation_id integer references calculation(id) NOT NULL);
---- Name: ganttdata; Type: TABLE; Schema: public; Owner: ---
CREATE TABLE IF NOT EXISTS ganttdata (    id serial primary key,    duration interval NOT NULL,    name text NOT NULL,    start_date timestamp with time zone NOT NULL,    end_data timestamp with time zone NOT NULL,    inner_guid uuid NOT NULL,    parent_guid uuid,    calculation_id integer references calculation(id) NOT NULL);
---- Name: preliminaries; Type: TABLE; Schema: public; Owner: ---
CREATE TABLE IF NOT EXISTS preliminaries (    id serial primary key,    extra_payment_name text NOT NULL,    preliminary_name text NOT NULL,    preliminary_value double precision,    calculation_id integer references calculation(id) NOT NULL);
---- Name: country; Type: TABLE; Schema: public; Owner: ---
CREATE TABLE IF NOT EXISTS country (    id serial primary key,    name character varying(255) NOT NULL);
---- Name: region; Type: TABLE; Schema: public; Owner: ---
CREATE TABLE IF NOT EXISTS region (    id serial primary key,    name character varying(255) NOT NULL,    country_id integer references country(id) NOT NULL,    rate double precision NOT NULL);
---- Name: invitation; Type: TABLE; Schema: public; Owner: ---
CREATE TABLE IF NOT EXISTS invitation (    id serial primary key,    email character varying(254) NOT NULL,    refer_host character varying(30) NOT NULL,    confirmation_key character varying(36) NOT NULL,    is_verified boolean NOT NULL,    invitation_time timestamp with time zone NOT NULL,    inviter_id uuid NOT NULL,    work_package_id integer NOT NULL);
---- Name: notification; Type: TABLE; Schema: public; Owner: ---
CREATE TABLE IF NOT EXISTS notification (    id serial primary key,    message text NOT NULL,    type integer NOT NULL,    is_shown boolean NOT NULL,    created timestamp with time zone NOT NULL,    profile_id uuid NOT NULL);
CREATE TABLE IF NOT EXISTS predicted_classification (    id SERIAL PRIMARY KEY,    bim_handle_id INTEGER REFERENCES bim_handle(id),    product_id INTEGER REFERENCES uniproduct(id),    system_id INTEGER REFERENCES unisystem(id),    confidence REAL);
CREATE TABLE IF NOT EXISTS classification_status (    id serial primary key,    document_id integer references document(id),    message text NOT NULL,    created timestamp with time zone default current_timestamp);
CREATE TABLE IF NOT EXISTS engine_mesh (    id serial primary key,    document_id integer references document(id),    data text NOT NULL,    CONSTRAINT engine_mesh_unique UNIQUE (document_id));
