
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

## Base de données

**ALERT** (<ins>id_alert</ins>, date_alert, longitude_alert, latitude_alert, _#id_fire_alert_)<br>
**FIRE** (<ins>id_fire</ins>, longitude_fire, latitude_fire, status_fire)<br>
**FIREMAN** (<ins>id_fireman</ins>, firstname_fireman, lastname_fireman, _#id_station_fireman_)<br>
**INTERVENTION** (<ins>id_intervention</ins>, date_intervention, status_intervention, _#id_fire_intervention_)<br>
**TRUCK_INTERVENTION** (<ins>_#id_truck_ti</ins>, <ins>_#id_intervention_ti_</ins>)<br>
**STATION** (<ins>id_station</ins>, longitude_station, latitude_station)<br>
**TRUCK** (<ins>id_truck</ins>, longitude_truck, latitude_truck, _#id_station_truck_)<br>
**FIRMEN_INTERVENTION** (<ins>_#id_firemen_fi_</ins>, <ins>_#id_intervention_fi_</ins>)

## Partie Logicielle

## Réseaux
