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
    energy_saving_lightbulbs: false,
    timestamp: "November 21st 2018, 14:52 a'"
  },
  {
    drive_car: false,
    fly_plane: false,
    renewable_energy: true,
    vegan: true,
    cold_water_wash: true,
    recycle: true,
    tumble_dryer: false,
    energy_saving_lightbulbs: true,
    timestamp: "December 14th 2018, 09:15 a'"
  },
  {
    drive_car: true,
    fly_plane: false,
    renewable_energy: true,
    vegan: false,
    cold_water_wash: true,
    recycle: true,
    tumble_dryer: false,
    energy_saving_lightbulbs: true,
    timestamp: "January 2nd 2019, 17:20 p'"
  },
  {
    drive_car: false,
    fly_plane: false,
    renewable_energy: true,
    vegan: true,
    cold_water_wash: true,
    recycle: true,
    tumble_dryer: false,
    energy_saving_lightbulbs: true,
    timestamp: "January 12th 2019, 11:40 a'"
  }
]);
