module PropositionsHelper

  def sign_button
    content_tag :a, :href => new_proposition_user_path(@petition) do
      content_tag :div, 'LiveSign', :class => 'live_sign_button'
    end
  end

end
