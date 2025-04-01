package model;

public class User {
    private String username;
    private String password;
    private String role;
    private String firstname;
    private String lastname;
    private String email;
    private String telephone;
    private String address;

    // Default Constructor
    public User() {}

    // Parameterized Constructor
    public User(String username, String password, String role, String firstname, String lastname, String email, String telephone, String address) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.telephone = telephone;
        this.address = address;
    }

    // Getters and Setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    // Optional: A method to print user details (useful for debugging)
    @Override
    public String toString() {
        return "User [username=" + username + ", role=" + role + ", firstname=" + firstname +
               ", lastname=" + lastname + ", email=" + email + ", telephone=" + telephone +
               ", address=" + address + "]";
    }
}
