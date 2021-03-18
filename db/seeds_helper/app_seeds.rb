require_relative 'seeds_helper'
require_relative 'environment_helper'
include EnvironmentHelper

class AppSeeds
  def self.generate_environment
    EnvironmentHelper.gen_jerry
    EnvironmentHelper.gen_model_1
    EnvironmentHelper.gen_model_2
  end
end 