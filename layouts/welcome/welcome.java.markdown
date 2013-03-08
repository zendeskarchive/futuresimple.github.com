    #!java
    class BaseLab extends Blog.Awesome {
      private Topic[] topics = new Topic[] {
        new Topic("technology"), new Topic ("coding") };
      private Map<AuthorType, String> authors = new HashMap<AuthorType, String>();
      public BaseLab() {
        authors.put(new AuthorType("devs"), "Makers of Base CRM");}
    }
    new BaseLab().publish();
