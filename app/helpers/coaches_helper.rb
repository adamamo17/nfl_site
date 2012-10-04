module CoachesHelper

  def all_coaches
    Coach.all.each do |coach|
      link_to coach.name + ".", "/coaches/" + "#{@coach.id}"
    end
  end

end
