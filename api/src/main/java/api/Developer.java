package api;

public class Developer {
    // private @Id @GeneratedValue long id;
    private final String first;
    private final String last;
    private final String email;
    private final String devClass;
    private final String phone;
    private final String webURL;
    private final String gitURL;
    private final String password;

    public Developer(String first, String last, String email, String devclass, String phone, String webURL,
            String gitURL, String password) {
        this.first = first;
        this.last = last;
        this.email = email;
        this.devClass = devclass;
        this.phone = phone;
        this.webURL = webURL;
        this.gitURL = gitURL;
        this.password = password;
    }

    // getter methods
    public String getFirstName() {
        return first;
    }

    public String getLastName() {
        return last;
    }

    public String getEmail() {
        return email;
    }

    public String getDevClass() {
        return devClass;
    }

    public String getPhone() {
        return phone;
    }

    public String getWebURL() {
        return webURL;
    }

    public String getGitURL() {
        return gitURL;
    }

    public String getPassword() {
        return password;
    }
}