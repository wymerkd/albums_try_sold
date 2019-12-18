require 'rspec'
require 'album'


describe '#Album' do
  before(:each) do
    Album.clear()
  end

  describe('.all') do
    it('returns an empty array when there are no albums') do
      expect(Album.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves an album') do
      album = Album.new("Giant Steps", nil, "1943", "Reggae", "Bob Marley", true)
      album.save()
      album2 = Album.new("Blue", nil, "1945", "Reggaeton", "Daddy Yankee", true)
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe("#==") do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new("Giant Steps", nil, "1943", "Reggae", "Bob Marley", true)
      album2 = Album.new("Giant Steps", nil, "1943", "Reggae", "Bob Marley", true)
      expect(album).to(eq(album2))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      album = Album.new("Giant Steps", nil, "1943", "Reggae", "Bob Marley", true)
      album.save()
      album2 = Album.new("Blue", nil, "1945", "Reggaeton", "Daddy Yankee", true)
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds an album by id') do
      album = Album.new("Giant Steps", nil, "1943", "Reggae", "Bob Marley", true)
      album.save()
      album2 = Album.new("Blue", nil, "1945", "Reggaeton", "Daddy Yankee", true)
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#update') do
    it('updates an album by id') do
      album = Album.new("Blue", nil, "1945", "Reggaeton", "Daddy Yankee", true)
      album.save()
      album.update("A Love Supreme", "1945", "Reggaeton", "Daddy Yankee", true)
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new("Giant Steps", nil, "1943", "Reggae", "Bob Marley", true)
      album.save()
      album2 = Album.new("Blue", nil, "1945", "Reggaeton", "Daddy Yankee", true)
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end
    describe('#search') do
      it("searches albums  by name") do
        album = Album.new("Giant Steps", nil, "1943", "Reggae", "Bob Marley", true)
        album.save()
        album2 = Album.new("Blue", nil, "1945", "Reggaeton", "Daddy Yankee", true)
        album2.save()
        expect(Album.search("Giant Steps")).to(eq([album]))
        expect(Album.search("Blue")).to(eq([album2]))
      end
  end
  describe('#sold') do
    it("determines if sold") do
      album = Album.new("Giant Steps", nil, "1943", "Reggae", "Bob Marley", true)
      album.save()
      expect(checked_value("1")).to(eq(true))
    end
  end
end
