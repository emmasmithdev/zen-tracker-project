export const homeData = function(footprints){

  return footprints.map(function(footprint){
    let score = 0.0
    if (footprint.renewable_energy){
      score += 1.5;
    }
    if (footprint.cold_water_wash){
      score += 0.247;
    }
    if (footprint.recycle){
      score += 0.2125;
    }
    if (!footprint.tumble_dryer){
      score += 0.21;
    }
    if (footprint.energy_saving_lightbulbs){
      score += 0.1;
    }
    return score;
  })
}
