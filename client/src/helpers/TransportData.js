export const transportData = function(footprints){

  return footprints.map(function(footprint) {
    if (!footprint.drive_car && !footprint.fly_plane){
      return 4;
    } else if (footprint.drive_car && !footprint.fly_plane){
      return 1.6;
    } else if (!footprint.drive_car && footprint.fly_plane){
      return 2.4;
    } else {
      return 0;
    }
  });
};
