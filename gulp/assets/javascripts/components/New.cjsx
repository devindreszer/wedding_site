React = require('react/addons')
$ = require('jquery')
classNames = require('classnames')

RegistrySection = require('./RegistrySection')
PhotoSection = require('./PhotoSection')

New = React.createClass
  getInitialState: ->
    mobileNavOpen: false

  handleMobileNavSelection: (event) ->
    @setState mobileNavOpen: false

  openMobileNav: (event) ->
    event.preventDefault()
    @setState mobileNavOpen: !@state.mobileNavOpen

  render: ->
    mobileNav = if @state.mobileNavOpen
      <div className='mobile-nav-items'>
        <a className='mobile-nav-item' href='/#home-section' onClick={@handleMobileNavSelection}>Home</a>
        <a className='mobile-nav-item' href='/#our-journey-section' onClick={@handleMobileNavSelection}>Our Story</a>
        <a className='mobile-nav-item' href='/#wedding-section' onClick={@handleMobileNavSelection}>Wedding</a>
        <a className='mobile-nav-item' href='/#reception-section' onClick={@handleMobileNavSelection}>Reception</a>
        <a className='mobile-nav-item' href='/#photos-section' onClick={@handleMobileNavSelection}>Photos</a>
        <a className='mobile-nav-item' href='/#registry-section' onClick={@handleMobileNavSelection}>Registry</a>
      </div>

    <div id='new-app'>
      <header>
        <nav id='desktop-nav'>
          <a className='desktop-nav-item' href='/#home-section'>Home</a>
          <a className='desktop-nav-item' href='/#our-journey-section'>Our Journey</a>
          <a className='desktop-nav-item' href='/#wedding-section'>Wedding</a>
          <a className='desktop-nav-item' href='/#reception-section'>Celebration</a>
          <a className='desktop-nav-item' href='/#photos-section'>Photos</a>
          <a className='desktop-nav-item' href='/#registry-section'>Registry</a>
        </nav>
        <div id='mobile-nav'>
          <a href='#'
            className='mobile-nav-menu'
            onClick={@openMobileNav}>Menu</a>
          {mobileNav}
        </div>
      </header>
      {@renderHomeSection()}
      {@renderOurJourneySection()}
      {@renderWeddingSection()}
      {@renderReceptionSection()}
      {@renderPhotoSection()}
      {@renderRegistrySection()}
    </div>

  renderHomeSection: ->
    <div id='home-section'>
      <div className='logo-section home-logo-image'>
        <div className='logo-image main-logo large-logo'>
        </div>
      </div>
    </div>

  renderOurJourneySection: ->
    <div id='our-journey-section'>
      <div className='header-section'>
        <div className='header-image our-journey-header'>
        </div>
      </div>
      <div className='map-container'>
        <div className='map-image'>
          <div className='map-image-container'>
          </div>
        </div>
        <div className='map-legend'>
        </div>
      </div>
    </div>

  renderWeddingSection: ->
    <div id='wedding-section'>
      <div className='logo-section wedding-logo-image'>
        <div className='logo-image wedding-logo large-logo'>
        </div>
      </div>
      <div className='header-section'>
        <div className='header-image wedding-header'>
        </div>
      </div>
      <div className='text-section'>
        {"On their fifth date on a hike in Butano State Park,
         Devin said that they would one day get married in that exact spot.
         It was pretty awkward, but Lindsey kind of liked the sound of it too.
         Nearly four years later, Devin's prediction is going to come true."}
      </div>
      <div className='location-section'>
        <div className='location-container'>
          <div className='location-image-container ceremony-site'
            style={backgroundImage: "url(https://lh3.googleusercontent.com/CgKrVK9K0NZA2eZhCR5GrN97MCx2lPo7RQVcBOl74nM=s461-no)"}>
          </div>
          <div className='location-text-section'>
            <div className='location-text-header'>Ceremony</div>
            <div className='location-text'>
              SATURDAY October 31, 2015 at 3:30pm<br/>
              Butano State Park<br/>
              Pescadero, CA<br/>
            </div>
          </div>
        </div>
        <div className='location-container'>
          <div className='location-image-container reception-site'>
          </div>
          <div className='location-text-section'>
            <div className='location-text-header'>Reception</div>
            <div className='location-text'>
              SATURDAY October 31, 2015 at 6:00pm<br/>
              Pie Ranch, 2080 Cabrillo Highway<br/>
              Pescadero, CA<br/>
            </div>
          </div>
        </div>
      </div>
      <div className='wedding-details-section'>
        <div className='subheader-section'>
          <div className='subheader-image ceremony-details-header'>
          </div>
        </div>
        <div className='text-section'>
          {"We would love it if our ceremony reflected the love and support that
           we get from all of you.  Please let us know if you would like to share
           something during the ceremony.  It can be anything - a reading, a
           musical performance, a memory, well wishes, etc."}
        </div>
        <div className='subheader-section'>
          <div className='subheader-image forest-formal-header'>
          </div>
        </div>
        <div className='text-section'>
          {"We will be doing a lot of walking on uneven dirt surfaces during the
           ceremony, cocktail hour, and reception, so shoes that are more
           comfortable or give better traction might be helpful. Bay Area weather
           can be quite unpredictable in the evenings, so it may also be good to
           have layering options in case it gets chilly."}
        </div>
      </div>
      <div className='itinerary-section'>
      </div>
    </div>

  renderReceptionSection: ->
    <div id='reception-section'>
      <div className='logo-section reception-logo-image'
        style={backgroundImage: "linear-gradient(rgba(16,20,23,1),rgba(16,20,23,0.6)), url(https://lh3.googleusercontent.com/qEfJoQAy413cZGNV_zVtwQnkcCKHC8PHV9XGw6K6PNE=w1094-h728-no)"}>
        <div className='logo-image reception-logo large-logo'>
        </div>
      </div>
      <div className='header-section'>
        <div className='header-image reception-header'>
        </div>
      </div>
      <div className='text-section'>
        {"We will be celebrating our marriage with friends and family at Janet
         and Peter Fontana's in Wrentham, MA in May 2016.  More details to come
         after our wedding ceremony."}
      </div>
      <div className='location-section'>
        <div className='location-image-container wrentham-site'
          style={backgroundImage: "url(https://lh3.googleusercontent.com/UG-tuHcc4Xm0ydoLMRCHM5riD1etWFMWb-5gf6i8zvg=s500-no)"}>
        </div>
        <div className='location-text-section'>
          <div className='location-text-header'>POST-WEDDING RECEPTION</div>
          <div className='location-text'>
            May 2016<br/>
            The Fontana Residence, 90 Oak Pt<br/>
            Wrentham, MA<br/>
          </div>
        </div>
      </div>
    </div>

  renderPhotoSection: ->
    <PhotoSection />

  renderRegistrySection: ->
    <RegistrySection />

module.exports = New
