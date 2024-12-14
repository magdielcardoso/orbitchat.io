export default {
  home: {
    title: 'Home',
    welcome: 'Welcome to OrbitChat'
  },
  chats: {
    title: 'Chats',
    noChats: 'No chats yet',
    newChat: 'New chat',
    searchPlaceholder: 'Search messages in chats',
    typeMessage: 'Type your message...',
    send: 'Send',
    status: {
      open: 'Open',
      online: 'Online',
      offline: 'Offline'
    },
    tabs: {
      mine: 'Mine',
      unassigned: 'Unassigned',
      all: 'All'
    },
    emptyState: {
      title: 'Oh no! Looks like there are no customer messages in your inbox.',
      shortcuts: {
        command: 'to open command menu',
        keyboard: 'to view keyboard shortcuts'
      }
    },
    sidebar: {
      filters: {
        title: 'Filters',
        all: 'All Chats',
        active: 'Active Chats',
        archived: 'Archived Chats'
      },
      labels: {
        title: 'Labels',
        important: 'Important',
        unread: 'Unread',
        flagged: 'Flagged'
      },
      teams: {
        title: 'Teams',
        myTeam: 'My Team',
        assignedToMe: 'Assigned to Me'
      }
    }
  },
  contacts: {
    title: 'Contacts',
    noContacts: 'No contacts yet',
    addContact: 'Add contact'
  },
  favorites: {
    title: 'Favorites',
    noFavorites: 'No favorites yet'
  },
  settings: {
    title: 'Settings',
    language: 'Language',
    selectLanguage: 'Select language',
    selectTheme: 'Select theme',
    themes: {
      light: 'Light Theme',
      dark: 'Dark Theme'
    },
    languageHelp: 'The selected language will be applied throughout the application',
    theme: 'Theme',
    notifications: 'Notifications',
    privacy: 'Privacy',
    sections: {
      preferences: {
        title: 'User Preferences',
        general: {
          title: 'General Settings',
          description: 'Configure your basic account settings'
        },
        profile: {
          title: 'Profile Settings',
          description: 'Manage your profile information'
        }
      },
      notifications: {
        title: 'Notifications',
        preferences: {
          title: 'Notification Preferences',
          description: 'Configure how you receive notifications'
        }
      },
      security: {
        title: 'Security',
        settings: {
          title: 'Security Settings',
          description: 'Manage your account security'
        },
        apiTokens: {
          title: 'API Tokens',
          description: 'Manage your API access tokens'
        }
      }
    }
  },
  auth: {
    login: {
      title: 'Sign in to your account',
      email: 'Email',
      password: 'Password',
      rememberMe: 'Remember me',
      loading: 'Loading...',
      submit: 'Sign in',
      noAccount: "Don't have an account? Sign up",
      error: 'Invalid email or password',
      hero: {
        title: 'Welcome to OrbitChat',
        feature1: {
          title: 'Simplified Communication',
          description: 'Manage all your conversations in one place efficiently and organized.'
        },
        feature2: {
          title: 'Integrated Teams',
          description: 'Collaborate with your team in real-time and keep everyone aligned.'
        },
        feature3: {
          title: 'Detailed Analytics',
          description: 'Track performance and make data-driven decisions.'
        }
      }
    },
    register: {
      title: 'Create your account',
      subtitle: 'Start your journey with us',
      name: 'Name',
      namePlaceholder: 'Enter your full name',
      email: 'Email',
      emailPlaceholder: 'Enter your email',
      password: 'Password',
      passwordPlaceholder: 'Enter your password',
      submit: 'Create account',
      loading: 'Creating...',
      error: 'Error creating account. Please try again.',
      hasAccount: 'Already have an account? Sign in',
      hero: {
        title: 'Welcome to OrbitChat',
        feature1: {
          title: 'Real-Time Communication',
          description: 'Instant chat with colleagues and teams'
        },
        feature2: {
          title: 'Advanced Security',
          description: 'Your conversations protected with encryption'
        },
        feature3: {
          title: 'Complete Integration',
          description: 'Connect with your favorite tools'
        }
      }
    }
  },
  admin: {
    users: {
      title: 'Users',
      description: 'Manage system users.',
      addUser: 'Add User',
      newUser: 'New User',
      confirmDelete: 'Are you sure you want to delete user {name}?',
      table: {
        name: 'Name',
        email: 'Email',
        role: 'Role',
        status: 'Status',
        actions: 'Actions'
      },
      status: {
        active: 'Active',
        inactive: 'Inactive'
      },
      form: {
        name: 'Name',
        email: 'Email',
        password: 'Password',
        role: 'Role',
        selectRole: 'Select a role',
        parentUser: 'Parent User',
        selectParentUser: 'Select parent user',
        agentInfo: 'An agent is a user who acts on behalf of a normal user. Agents can handle chats and interact with customers on behalf of the parent user. Each agent must be linked to a normal user.'
      },
      noUsers: 'No users found',
      noRole: 'No role assigned',
      loading: 'Loading users...'
    },
    roles: {
      title: 'Roles and Permissions',
      description: 'Manage system roles and their permissions.',
      addRole: 'Add Role',
      newRole: 'New Role',
      editRole: 'Edit Role',
      name: 'Role Name',
      description: 'Description',
      permissions: 'Permissions',
      confirmDelete: 'Are you sure you want to delete role {name}?',
      actions: {
        edit: 'Edit',
        delete: 'Delete'
      }
    }
  }
} 