# encoding: utf-8

class EpisodeUploader < CarrierWave::Uploader::Base
  storage :fog
end
