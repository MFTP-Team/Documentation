
# Documentation

Documentation du projet scientifique, équipe #13

Membres :  
| Prénom | Partie |
|--|--|
|Martin|Web/Java|
| François | Web/Java|
| Tanguy | IOT |
| Paul | Réseau |

### Schéma global de l'architecture

![Schéma Architecture   Flux drawio (3)](https://user-images.githubusercontent.com/57757196/206454879-7eb72521-6e4c-419a-bbe5-569a15b16526.png)

### Schéma Entité-Association

#### EmergencyManager

TO DO : UPDATE SCHEMA

![Schéma entité_association de la BDD Emergency Manager](https://user-images.githubusercontent.com/102656423/206508251-797f42bf-31cb-4f91-b98b-5bb9cc6441f2.svg)

#### Simulator

## Base de données

<img width="347" alt="image" src="https://user-images.githubusercontent.com/102656423/206653865-c0e83d61-f12b-48e8-9345-2f98a8593e85.png">


**ALERT** (<ins>id</ins>, date, longitude, latitude, intensity, _#id_fire_)<br>
**FIRE** (<ins>id</ins>, longitude, latitude, intensity, status)<br>
**FIREMAN** (<ins>id</ins>, firstname, lastname, _#id_station_)<br>
**INTERVENTION** (<ins>id</ins>, date, status, _#id_fire_)<br>
**TRUCK_INTERVENTION** (<ins>_#id_</ins>, <ins>_#id_</ins>)<br>
**STATION** (<ins>id</ins>, longitude, latitude)<br>
**TRUCK** (<ins>id_truck</ins>, longitude, latitude,power, _#id_station_)<br>
**FIREMEN_INTERVENTION** (<ins>_#id_firemen_</ins>, <ins>_#id_intervention_</ins>)

## Partie Logicielle

## Réseaux
