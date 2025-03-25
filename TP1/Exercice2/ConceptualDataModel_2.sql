/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     21/03/2025 10:59:36                          */
/*==============================================================*/


drop table if exists CLIENT;

drop table if exists CONTRAT;

drop table if exists PAIEMENT;

drop table if exists VEHICULE;

/*==============================================================*/
/* Table: CLIENT                                                */
/*==============================================================*/
create table CLIENT
(
   IDCLIENT             int not null,
   NOM                  varchar(20),
   PRENOM               varchar(20),
   EMAIL                varchar(20),
   TELEPHONE            varchar(20),
   PERMIS               bool,
   primary key (IDCLIENT)
);

/*==============================================================*/
/* Table: CONTRAT                                               */
/*==============================================================*/
create table CONTRAT
(
   IDCONTRAT            int not null,
   IDCLIENT             int not null,
   IDVEHICULE           int not null,
   DATEDEBUT            date,
   DATEFIN              date,
   PRIXTOTAL            int,
   primary key (IDCONTRAT)
);

/*==============================================================*/
/* Table: PAIEMENT                                              */
/*==============================================================*/
create table PAIEMENT
(
   IDPAIEMENT           int not null,
   IDCONTRAT            int not null,
   MONTANT              int,
   MODEPAIEMENT         varchar(20),
   DATEPAIEMENT         date,
   primary key (IDPAIEMENT)
);

/*==============================================================*/
/* Table: VEHICULE                                              */
/*==============================================================*/
create table VEHICULE
(
   IDVEHICULE           int not null,
   MARQUE               varchar(20),
   MODELE               varchar(20),
   IMMATRICULATION      varchar(20),
   ETAT                 varchar(20),
   KILOMETRAGE          int,
   DISPONIBILITE        bool,
   primary key (IDVEHICULE)
);

alter table CONTRAT add constraint FK_AVOIR foreign key (IDCLIENT)
      references CLIENT (IDCLIENT) on delete restrict on update restrict;

alter table CONTRAT add constraint FK_LOUER foreign key (IDVEHICULE)
      references VEHICULE (IDVEHICULE) on delete restrict on update restrict;

alter table PAIEMENT add constraint FK_PAYER foreign key (IDCONTRAT)
      references CONTRAT (IDCONTRAT) on delete restrict on update restrict;

