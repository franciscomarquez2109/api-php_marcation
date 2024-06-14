PGDMP  7    7                |         	   marcacion    16.2 (Debian 16.2-1.pgdg120+2)    16.2 (Debian 16.2-1.pgdg120+2) F    l           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            m           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            n           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            o           1262    16384 	   marcacion    DATABASE     t   CREATE DATABASE marcacion WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE marcacion;
                postgres    false            �            1259    16471 	   auditoria    TABLE     
  CREATE TABLE public.auditoria (
    id_auditoria integer NOT NULL,
    tabla character varying(50) NOT NULL,
    id_registro integer NOT NULL,
    fecha_cambio timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    tipo_cambio character varying(10) NOT NULL,
    detalles text,
    usuario character varying(50) NOT NULL,
    CONSTRAINT auditoria_tipo_cambio_check CHECK (((tipo_cambio)::text = ANY ((ARRAY['INSERT'::character varying, 'UPDATE'::character varying, 'DELETE'::character varying])::text[])))
);
    DROP TABLE public.auditoria;
       public         heap    postgres    false            �            1259    16470    auditoria_id_auditoria_seq    SEQUENCE     �   CREATE SEQUENCE public.auditoria_id_auditoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.auditoria_id_auditoria_seq;
       public          postgres    false    230            p           0    0    auditoria_id_auditoria_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.auditoria_id_auditoria_seq OWNED BY public.auditoria.id_auditoria;
          public          postgres    false    229            �            1259    16397    cargo    TABLE     n   CREATE TABLE public.cargo (
    id_cargo integer NOT NULL,
    nombre_cargo character varying(50) NOT NULL
);
    DROP TABLE public.cargo;
       public         heap    postgres    false            �            1259    16396    cargo_id_cargo_seq    SEQUENCE     �   CREATE SEQUENCE public.cargo_id_cargo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.cargo_id_cargo_seq;
       public          postgres    false    218            q           0    0    cargo_id_cargo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.cargo_id_cargo_seq OWNED BY public.cargo.id_cargo;
          public          postgres    false    217            �            1259    16390    departamento    TABLE     �   CREATE TABLE public.departamento (
    id_departamento integer NOT NULL,
    nombre_departamento character varying(50) NOT NULL
);
     DROP TABLE public.departamento;
       public         heap    postgres    false            �            1259    16389     departamento_id_departamento_seq    SEQUENCE     �   CREATE SEQUENCE public.departamento_id_departamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.departamento_id_departamento_seq;
       public          postgres    false    216            r           0    0     departamento_id_departamento_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.departamento_id_departamento_seq OWNED BY public.departamento.id_departamento;
          public          postgres    false    215            �            1259    16418    empleado    TABLE     m  CREATE TABLE public.empleado (
    id_empleado integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    direccion character varying(100),
    telefono character varying(20),
    correo_electronico character varying(50),
    id_departamento integer,
    id_cargo integer,
    estado integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.empleado;
       public         heap    postgres    false            �            1259    16417    empleado_id_empleado_seq    SEQUENCE     �   CREATE SEQUENCE public.empleado_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.empleado_id_empleado_seq;
       public          postgres    false    224            s           0    0    empleado_id_empleado_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.empleado_id_empleado_seq OWNED BY public.empleado.id_empleado;
          public          postgres    false    223            �            1259    16404    estado    TABLE     q   CREATE TABLE public.estado (
    id_estado integer NOT NULL,
    nombre_estado character varying(50) NOT NULL
);
    DROP TABLE public.estado;
       public         heap    postgres    false            �            1259    16403    estado_id_estado_seq    SEQUENCE     �   CREATE SEQUENCE public.estado_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.estado_id_estado_seq;
       public          postgres    false    220            t           0    0    estado_id_estado_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.estado_id_estado_seq OWNED BY public.estado.id_estado;
          public          postgres    false    219            �            1259    16452    evento_diario    TABLE     �   CREATE TABLE public.evento_diario (
    id_evento integer NOT NULL,
    id_empleado integer,
    fecha date NOT NULL,
    descripcion text,
    id_tipo_evento integer
);
 !   DROP TABLE public.evento_diario;
       public         heap    postgres    false            �            1259    16451    evento_diario_id_evento_seq    SEQUENCE     �   CREATE SEQUENCE public.evento_diario_id_evento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.evento_diario_id_evento_seq;
       public          postgres    false    228            u           0    0    evento_diario_id_evento_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.evento_diario_id_evento_seq OWNED BY public.evento_diario.id_evento;
          public          postgres    false    227            �            1259    16435    registro_marcacion    TABLE     �   CREATE TABLE public.registro_marcacion (
    id_registro integer NOT NULL,
    id_empleado integer,
    fecha date NOT NULL,
    hora_entrada time without time zone,
    hora_salida time without time zone,
    id_estado integer
);
 &   DROP TABLE public.registro_marcacion;
       public         heap    postgres    false            �            1259    16434 "   registro_marcacion_id_registro_seq    SEQUENCE     �   CREATE SEQUENCE public.registro_marcacion_id_registro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.registro_marcacion_id_registro_seq;
       public          postgres    false    226            v           0    0 "   registro_marcacion_id_registro_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.registro_marcacion_id_registro_seq OWNED BY public.registro_marcacion.id_registro;
          public          postgres    false    225            �            1259    16411    tipo_evento    TABLE     �   CREATE TABLE public.tipo_evento (
    id_tipo_evento integer NOT NULL,
    nombre_tipo_evento character varying(50) NOT NULL
);
    DROP TABLE public.tipo_evento;
       public         heap    postgres    false            �            1259    16410    tipo_evento_id_tipo_evento_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_evento_id_tipo_evento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.tipo_evento_id_tipo_evento_seq;
       public          postgres    false    222            w           0    0    tipo_evento_id_tipo_evento_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.tipo_evento_id_tipo_evento_seq OWNED BY public.tipo_evento.id_tipo_evento;
          public          postgres    false    221            �           2604    16474    auditoria id_auditoria    DEFAULT     �   ALTER TABLE ONLY public.auditoria ALTER COLUMN id_auditoria SET DEFAULT nextval('public.auditoria_id_auditoria_seq'::regclass);
 E   ALTER TABLE public.auditoria ALTER COLUMN id_auditoria DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    16400    cargo id_cargo    DEFAULT     p   ALTER TABLE ONLY public.cargo ALTER COLUMN id_cargo SET DEFAULT nextval('public.cargo_id_cargo_seq'::regclass);
 =   ALTER TABLE public.cargo ALTER COLUMN id_cargo DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    16393    departamento id_departamento    DEFAULT     �   ALTER TABLE ONLY public.departamento ALTER COLUMN id_departamento SET DEFAULT nextval('public.departamento_id_departamento_seq'::regclass);
 K   ALTER TABLE public.departamento ALTER COLUMN id_departamento DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    16421    empleado id_empleado    DEFAULT     |   ALTER TABLE ONLY public.empleado ALTER COLUMN id_empleado SET DEFAULT nextval('public.empleado_id_empleado_seq'::regclass);
 C   ALTER TABLE public.empleado ALTER COLUMN id_empleado DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    16407    estado id_estado    DEFAULT     t   ALTER TABLE ONLY public.estado ALTER COLUMN id_estado SET DEFAULT nextval('public.estado_id_estado_seq'::regclass);
 ?   ALTER TABLE public.estado ALTER COLUMN id_estado DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    16455    evento_diario id_evento    DEFAULT     �   ALTER TABLE ONLY public.evento_diario ALTER COLUMN id_evento SET DEFAULT nextval('public.evento_diario_id_evento_seq'::regclass);
 F   ALTER TABLE public.evento_diario ALTER COLUMN id_evento DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    16438    registro_marcacion id_registro    DEFAULT     �   ALTER TABLE ONLY public.registro_marcacion ALTER COLUMN id_registro SET DEFAULT nextval('public.registro_marcacion_id_registro_seq'::regclass);
 M   ALTER TABLE public.registro_marcacion ALTER COLUMN id_registro DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    16414    tipo_evento id_tipo_evento    DEFAULT     �   ALTER TABLE ONLY public.tipo_evento ALTER COLUMN id_tipo_evento SET DEFAULT nextval('public.tipo_evento_id_tipo_evento_seq'::regclass);
 I   ALTER TABLE public.tipo_evento ALTER COLUMN id_tipo_evento DROP DEFAULT;
       public          postgres    false    222    221    222            i          0    16471 	   auditoria 
   TABLE DATA           s   COPY public.auditoria (id_auditoria, tabla, id_registro, fecha_cambio, tipo_cambio, detalles, usuario) FROM stdin;
    public          postgres    false    230   �U       ]          0    16397    cargo 
   TABLE DATA           7   COPY public.cargo (id_cargo, nombre_cargo) FROM stdin;
    public          postgres    false    218   �U       [          0    16390    departamento 
   TABLE DATA           L   COPY public.departamento (id_departamento, nombre_departamento) FROM stdin;
    public          postgres    false    216   V       c          0    16418    empleado 
   TABLE DATA           �   COPY public.empleado (id_empleado, nombre, apellido, direccion, telefono, correo_electronico, id_departamento, id_cargo, estado) FROM stdin;
    public          postgres    false    224   GV       _          0    16404    estado 
   TABLE DATA           :   COPY public.estado (id_estado, nombre_estado) FROM stdin;
    public          postgres    false    220   �V       g          0    16452    evento_diario 
   TABLE DATA           c   COPY public.evento_diario (id_evento, id_empleado, fecha, descripcion, id_tipo_evento) FROM stdin;
    public          postgres    false    228   W       e          0    16435    registro_marcacion 
   TABLE DATA           s   COPY public.registro_marcacion (id_registro, id_empleado, fecha, hora_entrada, hora_salida, id_estado) FROM stdin;
    public          postgres    false    226   2W       a          0    16411    tipo_evento 
   TABLE DATA           I   COPY public.tipo_evento (id_tipo_evento, nombre_tipo_evento) FROM stdin;
    public          postgres    false    222   OW       x           0    0    auditoria_id_auditoria_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.auditoria_id_auditoria_seq', 1, false);
          public          postgres    false    229            y           0    0    cargo_id_cargo_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.cargo_id_cargo_seq', 1, true);
          public          postgres    false    217            z           0    0     departamento_id_departamento_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.departamento_id_departamento_seq', 1, true);
          public          postgres    false    215            {           0    0    empleado_id_empleado_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.empleado_id_empleado_seq', 12, true);
          public          postgres    false    223            |           0    0    estado_id_estado_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.estado_id_estado_seq', 1, false);
          public          postgres    false    219            }           0    0    evento_diario_id_evento_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.evento_diario_id_evento_seq', 1, false);
          public          postgres    false    227            ~           0    0 "   registro_marcacion_id_registro_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.registro_marcacion_id_registro_seq', 1, false);
          public          postgres    false    225                       0    0    tipo_evento_id_tipo_evento_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.tipo_evento_id_tipo_evento_seq', 1, false);
          public          postgres    false    221            �           2606    16480    auditoria auditoria_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT auditoria_pkey PRIMARY KEY (id_auditoria);
 B   ALTER TABLE ONLY public.auditoria DROP CONSTRAINT auditoria_pkey;
       public            postgres    false    230            �           2606    16402    cargo cargo_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id_cargo);
 :   ALTER TABLE ONLY public.cargo DROP CONSTRAINT cargo_pkey;
       public            postgres    false    218            �           2606    16395    departamento departamento_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id_departamento);
 H   ALTER TABLE ONLY public.departamento DROP CONSTRAINT departamento_pkey;
       public            postgres    false    216            �           2606    16423    empleado empleado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id_empleado);
 @   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pkey;
       public            postgres    false    224            �           2606    16409    estado estado_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id_estado);
 <   ALTER TABLE ONLY public.estado DROP CONSTRAINT estado_pkey;
       public            postgres    false    220            �           2606    16459     evento_diario evento_diario_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.evento_diario
    ADD CONSTRAINT evento_diario_pkey PRIMARY KEY (id_evento);
 J   ALTER TABLE ONLY public.evento_diario DROP CONSTRAINT evento_diario_pkey;
       public            postgres    false    228            �           2606    16440 *   registro_marcacion registro_marcacion_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.registro_marcacion
    ADD CONSTRAINT registro_marcacion_pkey PRIMARY KEY (id_registro);
 T   ALTER TABLE ONLY public.registro_marcacion DROP CONSTRAINT registro_marcacion_pkey;
       public            postgres    false    226            �           2606    16416    tipo_evento tipo_evento_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tipo_evento
    ADD CONSTRAINT tipo_evento_pkey PRIMARY KEY (id_tipo_evento);
 F   ALTER TABLE ONLY public.tipo_evento DROP CONSTRAINT tipo_evento_pkey;
       public            postgres    false    222            �           1259    16482    idx_empleado_cargo    INDEX     K   CREATE INDEX idx_empleado_cargo ON public.empleado USING btree (id_cargo);
 &   DROP INDEX public.idx_empleado_cargo;
       public            postgres    false    224            �           1259    16481    idx_empleado_departamento    INDEX     Y   CREATE INDEX idx_empleado_departamento ON public.empleado USING btree (id_departamento);
 -   DROP INDEX public.idx_empleado_departamento;
       public            postgres    false    224            �           1259    16484     idx_evento_diario_empleado_fecha    INDEX     h   CREATE INDEX idx_evento_diario_empleado_fecha ON public.evento_diario USING btree (id_empleado, fecha);
 4   DROP INDEX public.idx_evento_diario_empleado_fecha;
       public            postgres    false    228    228            �           1259    16483 %   idx_registro_marcacion_empleado_fecha    INDEX     r   CREATE INDEX idx_registro_marcacion_empleado_fecha ON public.registro_marcacion USING btree (id_empleado, fecha);
 9   DROP INDEX public.idx_registro_marcacion_empleado_fecha;
       public            postgres    false    226    226            �           2606    16429    empleado empleado_id_cargo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_id_cargo_fkey FOREIGN KEY (id_cargo) REFERENCES public.cargo(id_cargo);
 I   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_id_cargo_fkey;
       public          postgres    false    3252    218    224            �           2606    16424 &   empleado empleado_id_departamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES public.departamento(id_departamento);
 P   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_id_departamento_fkey;
       public          postgres    false    216    3250    224            �           2606    16460 ,   evento_diario evento_diario_id_empleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.evento_diario
    ADD CONSTRAINT evento_diario_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado);
 V   ALTER TABLE ONLY public.evento_diario DROP CONSTRAINT evento_diario_id_empleado_fkey;
       public          postgres    false    228    224    3258            �           2606    16465 /   evento_diario evento_diario_id_tipo_evento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.evento_diario
    ADD CONSTRAINT evento_diario_id_tipo_evento_fkey FOREIGN KEY (id_tipo_evento) REFERENCES public.tipo_evento(id_tipo_evento);
 Y   ALTER TABLE ONLY public.evento_diario DROP CONSTRAINT evento_diario_id_tipo_evento_fkey;
       public          postgres    false    222    3256    228            �           2606    16441 6   registro_marcacion registro_marcacion_id_empleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.registro_marcacion
    ADD CONSTRAINT registro_marcacion_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado);
 `   ALTER TABLE ONLY public.registro_marcacion DROP CONSTRAINT registro_marcacion_id_empleado_fkey;
       public          postgres    false    226    224    3258            �           2606    16446 4   registro_marcacion registro_marcacion_id_estado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.registro_marcacion
    ADD CONSTRAINT registro_marcacion_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES public.estado(id_estado);
 ^   ALTER TABLE ONLY public.registro_marcacion DROP CONSTRAINT registro_marcacion_id_estado_fkey;
       public          postgres    false    226    220    3254            i      x������ � �      ]      x�3��/H-JL�/����� (+)      [      x�3��/H-JL�/J-����� 5f      c   �   x��α
�0����)�u+I�Ժ)-�C���˥�j��`J|z����� g��8
�{�0\�ATo���-��9��2�X��T-�y����:�߁'���5'b&(I>�9���a�W���'J��^�Ø}S(�
Z
j�v(16˗�ͦtF(���w&qq�      _      x������ � �      g      x������ � �      e      x������ � �      a      x������ � �     