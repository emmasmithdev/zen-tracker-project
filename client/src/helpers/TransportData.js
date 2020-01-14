export const transportData = function(footprints){

  return footprints.map(function(footprint) {
    if (footprint.drive_car === false && footprint.fly_plane === false){
      return 4;
    } else if (footprint.drive_car === true && footprint.fly_plane === false){
      return 1.6;
    } else if (footprint.drive_car === false && footprint.fly_plane === true){
      return 2.4;
    } else {
      return 0;
    }
  });
};
