--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(40) NOT NULL,
    type character varying(40) NOT NULL,
    size character varying(40) NOT NULL,
    age integer NOT NULL,
    description text
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    has_craters boolean NOT NULL,
    radius_km numeric(5,2) NOT NULL,
    number_of_craters character varying(40) NOT NULL,
    planet_id integer NOT NULL
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
-- Name: phenomenon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.phenomenon (
    phenomenon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    spectral_type character varying(30) NOT NULL,
    magnitude numeric(5,2),
    duration_hours numeric(5,2)
);


ALTER TABLE public.phenomenon OWNER TO freecodecamp;

--
-- Name: phenomenon_phenomenon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.phenomenon_phenomenon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phenomenon_phenomenon_id_seq OWNER TO freecodecamp;

--
-- Name: phenomenon_phenomenon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.phenomenon_phenomenon_id_seq OWNED BY public.phenomenon.phenomenon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    has_life boolean NOT NULL,
    surface_temperature_celsius integer,
    surface_features text,
    ring_system boolean NOT NULL,
    name character varying(40) NOT NULL,
    star_id integer NOT NULL
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
    star_type character varying(40) NOT NULL,
    temperature_in_kelvin integer NOT NULL,
    distance_from_earth numeric(5,2) NOT NULL,
    has_planetary_system boolean NOT NULL,
    galaxy_id integer,
    name character varying(40) NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: phenomenon phenomenon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.phenomenon ALTER COLUMN phenomenon_id SET DEFAULT nextval('public.phenomenon_phenomenon_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Large', 130000, 'Our home galaxy containing the Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Massive', 200000, 'The nearest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Small', 50000, 'A smaller companion galaxy to Andromeda.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 'Large', 100000, 'Known for its distinctive shape resembling a hat.');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Elliptical', 'Giant', 120000, 'A peculiar galaxy with an active galactic nucleus.');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 'Large', 40000, 'Known for its prominent spiral arms.');
INSERT INTO public.galaxy VALUES (7, 'Messier', 'Elliptical', 'Massive', 60000, 'Contains the first-ever imaged black hole.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Luna', true, 177.10, 'High', 8);
INSERT INTO public.moon VALUES (3, 'Phobos', false, 11.10, 'Moderate', 1);
INSERT INTO public.moon VALUES (4, 'Deimos', false, 6.20, 'Low', 3);
INSERT INTO public.moon VALUES (5, 'Titan', true, 255.00, 'Low', 6);
INSERT INTO public.moon VALUES (6, 'Europa', true, 900.80, 'Moderate', 2);
INSERT INTO public.moon VALUES (7, 'Ganymede', true, 264.10, 'High', 9);
INSERT INTO public.moon VALUES (12, 'Callisto', true, 330.30, 'High', 11);
INSERT INTO public.moon VALUES (13, 'Io', true, 182.60, 'Moderate', 1);
INSERT INTO public.moon VALUES (14, 'Enceladus', true, 252.10, 'Low', 3);
INSERT INTO public.moon VALUES (15, 'Triton', true, 435.10, 'Moderate', 12);
INSERT INTO public.moon VALUES (16, 'Nereid', false, 170.00, 'Low', 11);
INSERT INTO public.moon VALUES (17, 'Iapetus', true, 962.00, 'High', 4);
INSERT INTO public.moon VALUES (18, 'Amalthea', false, 83.50, 'Low', 5);
INSERT INTO public.moon VALUES (19, 'Rhea', false, 758.00, 'High', 7);
INSERT INTO public.moon VALUES (20, 'Tethys', false, 536.30, 'Moderate', 8);
INSERT INTO public.moon VALUES (21, 'Mimas', false, 198.20, 'Low', 13);
INSERT INTO public.moon VALUES (22, 'Dione', true, 562.10, 'Moderate', 6);
INSERT INTO public.moon VALUES (23, 'Oberon', false, 765.90, 'Moderate', 2);
INSERT INTO public.moon VALUES (24, 'Miranda', false, 235.80, 'Moderate', 5);
INSERT INTO public.moon VALUES (25, 'Umbriel', false, 584.70, 'Moderate', 9);


--
-- Data for Name: phenomenon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.phenomenon VALUES (1, 'Aurora', 'Auroral', 5.50, 6.00);
INSERT INTO public.phenomenon VALUES (2, 'Comet', 'N/A', 4.20, 15.00);
INSERT INTO public.phenomenon VALUES (4, 'Nova', 'Stellar', 3.80, 4.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, true, 15, 'Contains continents, oceans, and diverse ecosystems.', false, 'Earth', 1);
INSERT INTO public.planet VALUES (2, false, -197, 'Rotates nearly on its side relative to its orbit.', true, 'Uranus', 1);
INSERT INTO public.planet VALUES (3, false, -160, 'Has a surface covered in ice with subsurface oceans.', false, 'Europa', 5);
INSERT INTO public.planet VALUES (4, false, -179, 'Has lakes of liquid methane and ethane on its surface.', false, 'Titan', 3);
INSERT INTO public.planet VALUES (5, false, -20, 'Rocky, potential habitability.', false, 'Tau Ceti e', 2);
INSERT INTO public.planet VALUES (6, false, -50, 'Rocky, possibly habitable.', false, 'LHS 1140 b', 3);
INSERT INTO public.planet VALUES (7, false, -60, 'Rocky surface.', false, 'Kepler-186f', 3);
INSERT INTO public.planet VALUES (8, false, -40, 'Rocky, possibly liquid water.', false, 'Gliese 581g', 6);
INSERT INTO public.planet VALUES (9, false, -30, 'Likely rocky, possible water.', false, 'TRAPPIST-1d', 2);
INSERT INTO public.planet VALUES (11, false, 1000, 'Hot and gaseous.', false, 'HD 209458 b', 6);
INSERT INTO public.planet VALUES (12, false, 80, 'Unknown.', false, 'KOI-3010.01', 4);
INSERT INTO public.planet VALUES (13, false, 2200, 'Extremely hot, gaseous.', false, 'Wasp-12b', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Main Sequence', 5778, 0.01, true, 1, 'Sun');
INSERT INTO public.star VALUES (2, 'Main sequence', 9940, 8.60, true, 1, 'Sirius');
INSERT INTO public.star VALUES (3, 'Main Sequence', 5790, 4.37, true, 2, 'Alpha Centauri');
INSERT INTO public.star VALUES (4, 'Red Supergiant', 3600, 643.00, true, 2, 'Betelgeuse');
INSERT INTO public.star VALUES (5, 'Red Dwarf', 3040, 4.24, true, 3, 'Proxima Centauri');
INSERT INTO public.star VALUES (6, 'Red Giant', 4286, 37.00, false, 5, 'Arcturus');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: phenomenon_phenomenon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.phenomenon_phenomenon_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


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
-- Name: phenomenon phenomenon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.phenomenon
    ADD CONSTRAINT phenomenon_pkey PRIMARY KEY (phenomenon_id);


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
-- Name: planet planet_surface_temperature_celsius_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_surface_temperature_celsius_key UNIQUE (surface_temperature_celsius);


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
-- Name: phenomenon unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.phenomenon
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

