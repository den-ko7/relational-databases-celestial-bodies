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
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    apparent_magnitude integer,
    constellation character varying(40),
    notes text
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
-- Name: life; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.life (
    has_life boolean NOT NULL,
    name character varying(40) NOT NULL,
    population integer,
    life_id integer NOT NULL
);


ALTER TABLE public.life OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.life_life_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_life_id_seq OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.life_life_id_seq OWNED BY public.life.life_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(40) NOT NULL,
    moon_id integer NOT NULL,
    date_discovered date,
    orbital_period numeric,
    planet_id integer,
    discovered_by character varying(60)
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
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    has_moon boolean,
    distance numeric,
    orbital_period integer,
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
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    has_planets boolean,
    distance numeric(8,2),
    spectral_type character varying(50),
    galaxy_id integer
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
-- Name: life life_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life ALTER COLUMN life_id SET DEFAULT nextval('public.life_life_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES ('milky way', 2, -7, 'sagittarius', 'this is the galaxy that contains the sun and it''s solar system');
INSERT INTO public.galaxy VALUES ('large magellanic cloud', 3, 1, 'dorado/mensa', 'it is the brightest patch of nebulosity in the sky');
INSERT INTO public.galaxy VALUES ('small magellanic cloud', 4, 3, 'tucana', 'visible only from the southern hemisphere');
INSERT INTO public.galaxy VALUES ('andromeda', 5, 3, 'andromeda-constellation', 'once called the great andromeda nebula');
INSERT INTO public.galaxy VALUES ('triangulum', 6, 6, 'triangulum-constellation', 'being a diffuse object, it''s visibility is strongly affected by even small amounts of light pollution');
INSERT INTO public.galaxy VALUES ('centaurus-A', 7, 7, 'centaurus-constellation', 'centaurus can sometimes be spotted by the naked eye');


--
-- Data for Name: life; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.life VALUES (true, 'earth', 8, 4);
INSERT INTO public.life VALUES (false, 'mars', 0, 5);
INSERT INTO public.life VALUES (false, 'jupiter', 0, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('earth moon', 1, '1609-01-01', 27.3, 1, 'Galileo');
INSERT INTO public.moon VALUES ('phobos', 2, '1877-01-01', 0.319, 2, 'Hall');
INSERT INTO public.moon VALUES ('deimos', 3, '1877-01-01', 1.262, 2, 'Hall');
INSERT INTO public.moon VALUES ('io', 4, '1610-01-01', 1.769, 5, 'Galileo');
INSERT INTO public.moon VALUES ('europa', 5, '1610-01-01', 3.551, 5, 'Galileo');
INSERT INTO public.moon VALUES ('ganymede', 6, '1610-01-01', 7.155, 5, 'Galileo');
INSERT INTO public.moon VALUES ('callisto', 7, '1610-01-01', 16.69, 5, 'Galileo');
INSERT INTO public.moon VALUES ('amalthea', 8, '1892-01-01', 0.498, 5, 'Barnard');
INSERT INTO public.moon VALUES ('himalia', 9, '1904-01-01', 250.56, 5, 'Perrine');
INSERT INTO public.moon VALUES ('elara', 10, '1905-01-01', 259.64, 5, 'Perrine');
INSERT INTO public.moon VALUES ('pasiphae', 11, '1908-01-01', 743.63, 5, 'Melotte');
INSERT INTO public.moon VALUES ('sinope', 12, '1914-01-01', 758.90, 5, 'Nicholson');
INSERT INTO public.moon VALUES ('lysithea', 13, '1938-01-01', 259.20, 5, 'Nicholson');
INSERT INTO public.moon VALUES ('carme', 14, '1938-01-01', 734.17, 5, 'Nicholson');
INSERT INTO public.moon VALUES ('mimas', 15, '1789-01-01', 0.942, 6, 'Herschel');
INSERT INTO public.moon VALUES ('enceladus', 16, '1789-01-01', 1.370, 6, 'Herschel');
INSERT INTO public.moon VALUES ('tethys', 17, '1684-01-01', 1.888, 6, 'Cassini');
INSERT INTO public.moon VALUES ('dione', 18, '1684-01-01', 2.737, 6, 'Cassini');
INSERT INTO public.moon VALUES ('rhea', 19, '1672-01-01', 4.518, 6, 'Cassini');
INSERT INTO public.moon VALUES ('titan', 20, '1655-01-01', 15.95, 6, 'Huygens');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('proxima centuri', 9, false, 4.2, 550000, 6);
INSERT INTO public.planet VALUES ('neptune', 8, true, 0.0004, 165, 1);
INSERT INTO public.planet VALUES ('earth', 1, true, 0, 365, 1);
INSERT INTO public.planet VALUES ('uranus', 7, true, 0.0003, 31025, 1);
INSERT INTO public.planet VALUES ('saturn', 6, true, 0.00001, 10585, 1);
INSERT INTO public.planet VALUES ('jupiter', 5, true, 0.00007, 4380, 1);
INSERT INTO public.planet VALUES ('mercury', 4, false, 0.000005, 88, 1);
INSERT INTO public.planet VALUES ('venus', 3, false, 0.00001, 225, 1);
INSERT INTO public.planet VALUES ('mars', 2, true, 0.00002, 687, 1);
INSERT INTO public.planet VALUES ('proxima centuri B', 10, false, 4.24, 11, 6);
INSERT INTO public.planet VALUES ('pa-99-n2', 11, false, 2185247, 6, 4);
INSERT INTO public.planet VALUES ('proxima centuri C', 12, false, 4.2, 5, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('sun', 1, true, 0.00, 'F-type-star', 2);
INSERT INTO public.star VALUES ('ab7', 3, false, 197000.00, 'wolf-rayet-star', 4);
INSERT INTO public.star VALUES ('bat99-7', 2, false, 3.26, 'wolf-rayet-star', 3);
INSERT INTO public.star VALUES ('alpha centuri', 6, true, 4.37, 'g-type-star', 7);
INSERT INTO public.star VALUES ('beta trianguli', 5, false, 127.00, 'a-type-star', 6);
INSERT INTO public.star VALUES ('alpha andromedae', 4, true, 97.00, 'b-type-star', 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: life_life_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.life_life_id_seq', 6, true);


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
-- Name: life life_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_pkey PRIMARY KEY (life_id);


--
-- Name: life life_planet_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_planet_key UNIQUE (name);


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
-- Name: life life_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_planet_fkey FOREIGN KEY (name) REFERENCES public.planet(name);


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

