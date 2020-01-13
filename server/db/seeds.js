use carbon_data;
db.dropDatabase();

db.footprint.insertMany([
  {
    drive_car: true,
    fly_plane: true,
    renewable_energy: false,
    vegan: false,
    cold_water_wash: false,
    recycle: true,
    tumble_dryer: false,
    energy_saving_lightbulbs: false
  },
  {
    drive_car: false,
    fly_plane: false,
    renewable_energy: true,
    vegan: true,
    cold_water_wash: true,
    recycle: true,
    tumble_dryer: false,
    energy_saving_lightbulbs: true
  },
  {
    drive_car: true,
    fly_plane: false,
    renewable_energy: true,
    vegan: false,
    cold_water_wash: true,
    recycle: true,
    tumble_dryer: false,
    energy_saving_lightbulbs: true
  },
  {
    drive_car: false,
    fly_plane: false,
    renewable_energy: true,
    vegan: true,
    cold_water_wash: true,
    recycle: true,
    tumble_dryer: false,
    energy_saving_lightbulbs: true
  }
]);
