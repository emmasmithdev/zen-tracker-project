export const dietData = function(footprints){

  return footprints.map(function(footprint) {
    if (footprint.vegan === true){
      return 0.8;
    } else {
      return 0;
    }
    });
};
