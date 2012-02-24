    #!cpp
    class FutureSimpleLab : public AwesomeBlog {
      public:
      FutureSimpleLab() {
        topics.push_back("technology");
        topics.push_back("coding");
        authors.insert(std::make_pair<std::string, std::string>("devs", "Makers of Base CRM and QuoteBase"));
    };

    FutureSimpleLab futureSimpleLab;
    futureSimpleLab.publish();
