    #!cpp
    class FutureSimpleLab : public AwesomeBlog {
      public:
      FutureSimpleLab() {
        topics.push_back("technology");
        topics.push_back("coding");
        authors.insert(std::make_pair<std::string, std::string>("devs", "Makers of Base CRM and QuoteBase"));
      };
      protected:
      std::vector<std::string> topics;
      std::map<std::string, std::string> authors;
    };

    FutureSimpleLab futureSimpleLab;
    futureSimpleLab.publish();
