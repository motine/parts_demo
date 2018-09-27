describe Organization do
  context 'validations' do
    it 'validates presence of name' do
      subject.valid?
      expect(subject.errors.details[:name]).to include({ error: :blank })
    end
  end
end
