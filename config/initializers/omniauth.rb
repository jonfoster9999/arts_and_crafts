Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, "1407881039277608", "0f2a7d59874b514b26df94a2f1a82bc2"
end