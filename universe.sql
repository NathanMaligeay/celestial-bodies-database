--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    radius_in_light_year integer,
    number_of_stars_inside bigint,
    galaxy_type character varying(20) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: inhabitants; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.inhabitants (
    name character varying(30) NOT NULL,
    inhabitants_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.inhabitants OWNER TO freecodecamp;

--
-- Name: inhabitants_specie_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.inhabitants_specie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inhabitants_specie_id_seq OWNER TO freecodecamp;

--
-- Name: inhabitants_specie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.inhabitants_specie_id_seq OWNED BY public.inhabitants.inhabitants_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    is_our_moon boolean,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_moon boolean,
    radius_in_km numeric(7,1),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(30),
    star_type character varying(30),
    star_radius integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: inhabitants inhabitants_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants ALTER COLUMN inhabitants_id SET DEFAULT nextval('public.inhabitants_specie_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 70000, 150000000000, 'spiral');
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 13, 1000000000, 'irregular');
INSERT INTO public.galaxy VALUES (3, 'SagDEG', 5000, NULL, 'elliptic');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 7000, 30000000000, 'spiral');
INSERT INTO public.galaxy VALUES (5, 'Boötes I', NULL, NULL, 'spheroidal');
INSERT INTO public.galaxy VALUES (6, 'Segue 1', 200, 230000, 'spheroidal');


--
-- Data for Name: inhabitants; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.inhabitants VALUES ('Human', 1, 3);
INSERT INTO public.inhabitants VALUES ('Cat', 2, 3);
INSERT INTO public.inhabitants VALUES ('Aliens', 3, 4);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, 'Beautiful and shiny at night');
INSERT INTO public.moon VALUES (2, 'LUA', 4, false, 'Never seen');
INSERT INTO public.moon VALUES (3, 'Maan', 10, false, 'Made for greatness');
INSERT INTO public.moon VALUES (4, 'Alk', 10, false, 'Tingles magic');
INSERT INTO public.moon VALUES (5, 'Sah', 10, false, 'Redish color');
INSERT INTO public.moon VALUES (6, 'Mjesec', 4, false, 'As white as snow');
INSERT INTO public.moon VALUES (7, 'Chanl', 6, false, 'Blue like the ocean');
INSERT INTO public.moon VALUES (8, 'Eight', 8, false, 'Small');
INSERT INTO public.moon VALUES (9, 'Moon the remake', 4, false, 'Wants to be like the moon but is not');
INSERT INTO public.moon VALUES (10, 'Almost done', 5, false, 'Yep');
INSERT INTO public.moon VALUES (11, 'A', 10, false, 'Issou');
INSERT INTO public.moon VALUES (12, 'B', 10, false, 'That''s a lot of moon for such a small planet');
INSERT INTO public.moon VALUES (13, 'C', 10, false, 'Again');
INSERT INTO public.moon VALUES (14, 'D', 10, false, 'Again');
INSERT INTO public.moon VALUES (15, 'E', 10, false, 'Again');
INSERT INTO public.moon VALUES (16, 'F', 10, false, 'Again');
INSERT INTO public.moon VALUES (17, 'G', 10, false, 'Again');
INSERT INTO public.moon VALUES (18, 'H', 10, false, 'Again');
INSERT INTO public.moon VALUES (19, 'I', 10, false, 'Again');
INSERT INTO public.moon VALUES (20, 'J', 10, false, 'Finally');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 2439.7, 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 6051.8, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 6371.0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', true, 3389.5, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, 69911.0, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', true, 58232.0, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', true, 25362.0, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', true, 24622.0, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', NULL, 7598.0, 3);
INSERT INTO public.planet VALUES (10, 'Iuconnu', true, 1166.0, 5);
INSERT INTO public.planet VALUES (11, 'Hade IV', false, 569781.0, 6);
INSERT INTO public.planet VALUES (12, 'Terminus', false, NULL, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'Yellow Dwarf', 695700);
INSERT INTO public.star VALUES (2, 2, 'Sirius', 'Binary Star', 1190513);
INSERT INTO public.star VALUES (3, 1, 'Proxima Centauri', 'Red Dwarf', 107280);
INSERT INTO public.star VALUES (4, 1, 'Barnard''s Star', 'Red Dwarf', 136360);
INSERT INTO public.star VALUES (5, 5, 'Cugel', 'Red Giant', 958146);
INSERT INTO public.star VALUES (6, 3, 'Betelgeuse', 'Neutron Star', 368912);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: inhabitants_specie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.inhabitants_specie_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: inhabitants inhabitants_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants
    ADD CONSTRAINT inhabitants_name_key UNIQUE (name);


--
-- Name: inhabitants inhabitants_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants
    ADD CONSTRAINT inhabitants_pkey PRIMARY KEY (inhabitants_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: inhabitants inhabitants_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants
    ADD CONSTRAINT inhabitants_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

