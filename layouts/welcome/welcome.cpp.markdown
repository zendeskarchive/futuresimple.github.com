    #!cpp
    class BaseLab: public AwesomeBlog {
      public:
      BaseLab() {
        topics.push_back("technology");
        topics.push_back("coding");
        authors["devs"] = "Makers of Base CRM";
    };

    BaseLab::publish();
